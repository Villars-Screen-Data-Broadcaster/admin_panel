import 'package:admin_panel/components/common/navigation_bar/common.dart';
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
                                button(
                                    [
                                      FontAwesomeIcon(
                                          icon: 'cloud-arrow-up',
                                          classes: 'icon'
                                      ),
                                      text('Envoyer un élément')
                                    ],
                                    classes: 'file-button'
                                ),
                                button(
                                    [
                                      FontAwesomeIcon(
                                          icon: 'folder-plus',
                                          classes: 'icon'
                                      ),
                                      text('Nouveau dossier')
                                    ],
                                    classes: 'file-button'
                                )
                              ],
                              classes: 'button-container'
                          )
                        ],
                        classes: 'label'
                    ),
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