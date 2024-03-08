import 'package:admin_panel/components/common/navigation_bar/common.dart';
import 'package:jaspr/jaspr.dart';


enum NodeType {
  file('file'),
  folder('folder');

  final String name;

  const NodeType(this.name);
}

class FileNode extends StatelessComponent {
  final NodeType type;
  final String label;

  FileNode(this.type, this.label);

  @override
  Iterable<Component> build(BuildContext context) {
    return [
      p(
          [
            FontAwesomeIcon(
                icon: type.name,
                classes: 'icon'
            ),
            p(
                [text(label)],
                classes: 'label'
            )
          ],
          classes: 'display',
      )
    ];
  }
}

class DirectoryNode extends FileNode {
  final String href;
  final List<FileNode> children;

  factory DirectoryNode({required String label, List<FileNode> children = const []}) {
    String href = label.toLowerCase().replaceAll(' ', '_');

    return DirectoryNode._internal(
        label,
        href,
        children.map(
                (child) => child is DirectoryNode
                    ? child.buildWithHrefPrefix(href)
                    : child
        ).toList(growable: false)
    );
  }

  DirectoryNode._internal(String label, this.href, this.children)
      : super(NodeType.folder, label);

  DirectoryNode buildWithHrefPrefix(String hrefPrefix) {
    return DirectoryNode._internal(super.label, '$hrefPrefix-$href', children);
  }

  @override
  Iterable<Component> build(BuildContext context) {
    return children.isEmpty
        ? [
          a(
              super.build(context).toList(growable: false),
              href: 'files#$href',
              classes: 'directory-node'
          )
        ]
        : [
          a(
              super.build(context).toList(growable: false),
              href: 'files#$href',
              classes: 'directory-node',
          ),
          div(children, classes: 'children')
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