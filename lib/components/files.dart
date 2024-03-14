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
                    [text('Arborescence')],
                    classes: 'label'
                  ),
                  div(
                      [
                        DirectoryTree(
                            subDirectories: [
                              DirectoryNode(
                                  label: 'test with a long title',
                                  subDirectories: [
                                    DirectoryNode(label: 'foo'),
                                    DirectoryNode(label: 'bar'),
                                    DirectoryNode(
                                        label: 'another test yes',
                                        subDirectories: [
                                          DirectoryNode(label: 'fizz'),
                                          DirectoryNode(label: 'buzz'),
                                        ],
                                        files: [FileNode('fizzbuzz')]
                                    ),
                                  ],
                                  files: [FileNode('file')]
                              )
                            ]
                        ).toComponent()
                      ],
                      classes: 'body'
                  )
                ],
                classes: 'fm-container directory-tree'
              ),
              section(
                  [
                    div(
                        [
                          h1(
                              [text('Contenu de <dossier>')],
                              classes: 'title'
                          ),
                          div(
                              [
                                FileButton(
                                    icon: 'cloud-arrow-up',
                                    label: 'Envoyer un élément'
                                ),
                                FileButton(
                                    icon: 'folder-plus',
                                    label: 'Nouveau dossier'
                                )
                              ],
                              classes: 'button-container'
                          )
                        ],
                        classes: 'label'
                    ),
                    div(
                        [
                          File(
                              label: 'test',
                              size: 2222244444,
                              creationDate: DateTime.timestamp().add(Duration(days: 30 * 7))
                          ),
                          File(
                              label: 'test',
                              size: 2222244444,
                              creationDate: DateTime.timestamp().add(Duration(days: 30 * 7))
                          ),
                          File(
                              label: 'test',
                              size: 2222244444,
                              creationDate: DateTime.timestamp().add(Duration(days: 30 * 7))
                          ),
                          Directory(
                              label: 'test',
                              size: 2222244444,
                              creationDate: DateTime.timestamp().add(Duration(days: 30 * 7))
                          ),
                        ],
                        classes: 'body'
                    )
                  ],
                  classes: 'fm-container directory-content'
              )
            ],
            classes: 'file-manager'
          )
        ],
        id: 'files',
        classes: 'base-component'
    );
  }
}