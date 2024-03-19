import 'package:jaspr/jaspr.dart';

import 'package:admin_panel/components/common/navigation_bar/common.dart';


enum NodeType {
  file('file'),
  folder('folder');

  final String name;

  const NodeType(this.name);
}

abstract class Node {
  StatelessComponent toComponent();
}

class FileNode implements Node {
  final NodeType type;
  final String label;

  FileNode({required this.label, this.type = NodeType.file});

  @override
  StatelessComponent toComponent() => _FileComponent(type, label);
}

class _FileComponent extends StatelessComponent {
  final NodeType type;
  final String label;

  _FileComponent(this.type, this.label);

  @override
  Iterable<Component> build(BuildContext context) {
    return [
      p(
          [
            FontAwesomeIcon(
                icon: type.name,
                classes: 'icon'
            ),
            text(label)
          ],
          classes: 'display',
      )
    ];
  }
}

class DirectoryNode implements Node {
  final String label;
  String href;
  final Iterable<DirectoryNode> subDirectories;
  final Iterable<FileNode> files;

  DirectoryNode({required this.label, this.subDirectories = const [], this.files = const []})
      : href = label.toLowerCase().replaceAll(' ', '_');

  DirectoryNode._parent({this.subDirectories = const [], this.files = const []})
      : label = '/', href = '';

  set hrefPrefix(String prefix) {
    href = prefix == '' ? href : '$prefix-$href';

    for (var subDir in subDirectories) {
      subDir.hrefPrefix = href;
    }
  }

  @override
  StatelessComponent toComponent() => _DirectoryComponent(label, href, subDirectories, files);
}

class DirectoryTree extends DirectoryNode {
  DirectoryTree({super.subDirectories, super.files}) : super._parent();

  @override
  StatelessComponent toComponent() {
    super.hrefPrefix = href;

    return _DirectoryComponent(super.label, super.href, super.subDirectories, super.files);
  }
}

class ExpandableComponent extends StatelessComponent {
  final Component label;
  final Component? nullableDropdown;

  ExpandableComponent({required this.label, Component? dropdown})
      : nullableDropdown = dropdown;

  @override
  Iterable<Component> build(BuildContext context) {
    return [
      details(
          [
            summary(
                [
                  button(
                      [FontAwesomeIcon(icon: 'angle-right', classes: 'dropdown-icon')],
                      classes: 'dropdown-button'
                  ),
                  label
                ],
                classes: 'dir-display'
            ),
            if (nullableDropdown case final dropdown?) dropdown
          ],
          classes: 'dropdown'
      )
    ];
  }
}

class _DirectoryComponent extends _FileComponent {
  final String href;
  final List<StatelessComponent> children;

  _DirectoryComponent(String label, this.href, Iterable<DirectoryNode> subDirectories, Iterable<FileNode> files)
      : children = <Node>[
          ...subDirectories,
          ...files
        ].map((transferrable) => transferrable.toComponent()).toList(growable: false),
        super(NodeType.folder, label);

  @override
  Iterable<Component> build(BuildContext context) {
    return [
      ExpandableComponent(
          label: a(
              super.build(context).toList(growable: false),
              href: '#$href',
              classes: 'directory-node',
          ),
          dropdown: children.isNotEmpty ? div(children, classes: 'children') : null,
      )
    ];
  }
}


class FileButton extends StatelessComponent {
  final String icon;
  final String? label;
  final String? classes;

  FileButton({required this.icon, required String this.label, this.classes});
  FileButton.blank({required this.icon}) : label = null, classes = null;

  @override
  Iterable<Component> build(BuildContext context) {
    return [
      button(
          [
            FontAwesomeIcon(
                icon: icon,
                classes: label == null ? 'icon blank' : 'icon'
            ),
            if (label case final notNullLabel?) text(notNullLabel)
          ],
          classes: 'file-button${classes != null ? ' $classes' : ''}'
      )
    ];
  }
}


class FileManagerComponent extends StatelessComponent {
  final FontAwesomeIcon icon;
  final String label;
  final int size;
  final DateTime creationDate;
  final FileButton? additionalButton;

  String get sizeToString => switch (size) {
    < 1e3 => '${size.toStringAsPrecision(3)} b',
    >= 1e3 && < 1e6 => '${(size / 1e3).toStringAsPrecision(3)} Kb',
    >= 1e6 && < 1e9 => '${(size / 1e6).toStringAsPrecision(3)} Mb',
    >= 1e9 && < 1e12 => '${(size / 1e9).toStringAsPrecision(3)} Gb',
    _ => '${(size / 1e12).toStringAsPrecision(3)} Tb'
  };

  FileManagerComponent(this.icon, {required this.label, required this.size, required this.creationDate, this.additionalButton});

  @override
  Iterable<Component> build(BuildContext context) {
    return [
      div(
          [
            div(
                [
                  icon,
                  p(
                      [text(label)],
                      classes: 'label'
                  )
                ],
                classes: 'display'
            ),
            p(
                [text(sizeToString)],
                classes: 'size'
            ),
            p(
                [text('${creationDate.day.toString().padLeft(2, '0')}/${creationDate.month.toString().padLeft(2, '0')}/${creationDate.year}')],
                classes: 'creation-date'
            ),
            div(
                [
                  if (additionalButton case final button?) button,
                  FileButton(
                      icon: 'pencil',
                      label: 'Renommer'
                  ),
                  FileButton(
                      icon: 'trash',
                      label: 'Supprimer',
                      classes: 'delete'
                  )
                ],
                classes: 'file-button-container'
            )
          ],
          classes: 'fm-component'
      )
    ];
  }
}

class File extends FileManagerComponent {
  File({required super.label, required super.size, required super.creationDate})
      : super(
          FontAwesomeIcon(
              icon: 'file',
              classes: 'icon file'
          ),
          additionalButton: FileButton.blank(icon: 'download')
      );
}

class Directory extends FileManagerComponent {
  Directory({required super.label, required super.size, required super.creationDate})
      : super(
          FontAwesomeIcon(
              icon: 'folder',
              classes: 'icon folder'
          )
      );
}