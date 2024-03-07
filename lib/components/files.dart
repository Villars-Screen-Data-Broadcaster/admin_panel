import 'package:admin_panel/components/files_components.dart';
import 'package:jaspr/jaspr.dart';

import 'common/navigation_bar/navigation_bar.dart';


class FilesPage extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield SideNavigationMenu(index: 'files');

    yield section(
        [
          h1(
              [text('Menu de gestion des fichiers')],
              classes: 'title'
          ),
          p(
              [text("Grâce à l'interface ci-dessous, vous pouvez librement "
                  "ajouter, supprimer, déplacer, et modifier certaines des "
                  "propriétés des fichiers stockés sur le serveur à votre "
                  "guise. La création de nouveaux dossiers est donc tout "
                  "autant possible que le reste.")],
              classes: 'description'
          ),
          section(
            [
              section(
                [
                  h1(
                    [text('Dossiers')],
                    classes: 'label'
                  ),
                  div(
                    [
                      DirectoryTree(
                          label: 'test',
                          children: [
                            DirectoryTree(label: 'foo'),
                            DirectoryTree(label: 'bar'),
                          ]
                      )
                    ]
                  )
                ],
                classes: 'floating fm-container directories'
              ),
            ],
            classes: 'files-manager'
          )
        ],
        id: 'files',
        classes: 'base-component'
    );
  }
}