import 'package:admin_panel/components/common/navigation_bar/common.dart';
import 'package:jaspr/jaspr.dart';


class DirectoryNode extends StatelessComponent {
  final String label;
  final String href;

  DirectoryNode(this.label, this.href);

  @override
  Iterable<Component> build(BuildContext context) {
    return [
      a(
          [
            FontAwesomeIcon(
                icon: 'folder',
                classes: 'icon'
            ),
            p(
                [text(label)],
                classes: 'label'
            )
          ],
          classes: 'display',
          href: href
      )
    ];
  }
}

class DirectoryTree extends StatelessComponent {
  final DirectoryNode node;
  final List<Component> children;

  factory DirectoryTree({required String label, List<DirectoryTree> children = const []}) {
    final node = DirectoryNode(label, label.toLowerCase().replaceAll(' ', '_'));

    return children.isEmpty
        ? DirectoryTree._internalEmpty(node)
        : DirectoryTree._internal(
            node,
            children.map((child) => DirectoryTree._raw(
                DirectoryNode(child.node.label, '${node.href}-${child.node.href}'),
                child.children
            ))
        );
  }

  DirectoryTree._raw(this.node, this.children);

  DirectoryTree._internal(this.node, Iterable<DirectoryTree> children)
      : assert(children.isNotEmpty, "DirectoryTree children list cannot be empty. Consider using DirectoryTree._internal instead."),
        children = [
          node,
          div(
              children.toList(growable: false),
              classes: 'children'
          )
        ];

  DirectoryTree._internalEmpty(this.node) : children = [node];

  @override
  Iterable<Component> build(BuildContext context) {
    return [div(children, classes: 'directory-tree')];
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