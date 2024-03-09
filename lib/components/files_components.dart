import 'package:admin_panel/components/common/navigation_bar/common.dart';
import 'package:jaspr/jaspr.dart';


enum NodeType {
  file('file'),
  folder('folder');

  final String name;

  const NodeType(this.name);
}

abstract class _ComponentTransferrable {
  StatelessComponent toComponent();
}

class FileNode implements _ComponentTransferrable {
  final NodeType type;
  final String label;

  FileNode(this.type, this.label);

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

class DirectoryNode implements _ComponentTransferrable {
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
      : children = <_ComponentTransferrable>[
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


class File extends _FMComponent {
  File({required super.label, required super.size, required super.creationDate})
      : super(
          FontAwesomeIcon(
              icon: 'file',
              classes: 'icon file'
          )
      );
}

class Directory extends _FMComponent {
  Directory({required super.label, required super.size, required super.creationDate})
      : super(
          FontAwesomeIcon(
              icon: 'folder',
              classes: 'icon folder'
          )
      );
}

class _FMComponent extends StatelessComponent {
  final FontAwesomeIcon icon;
  final String label;
  final String size;
  final String creationDate;

  _FMComponent(this.icon, {required this.label, required this.size, required this.creationDate});

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
                [text(size)],
                classes: 'size'
            ),
            p(
                [text(creationDate)],
                classes: 'creation-date'
            ),
          ],
          classes: 'fm-component'
      )
    ];
  }
}