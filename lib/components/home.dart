import 'package:admin_panel/components/common/navigation_bar/common.dart';
import 'package:admin_panel/components/home_components.dart';
import 'package:jaspr/jaspr.dart';

import 'common/navigation_bar/navigation_bar.dart';


class HomePage extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield SideNavigationMenu(index: 'home');
    
    yield section(
      [
        div(
            [
              div(
                  [
                    h1(
                        [
                          FontAwesomeIcon(
                              icon: 'user-gear',
                              classes: 'icon'
                          ),
                          text('Panel Administrateur – Accueil')
                        ],
                        classes: 'title'
                    ),
                    h3(
                        [text('Bienvenue à nouveau, cher administrateur !')],
                        classes: 'subtitle'
                    ),
                    p(
                        [text('Voyez ici les statistiques du logiciel de '
                            'Villars Screen Data Broadcaster (VSDB), effectuez '
                            'des modifications sur les fichiers, diaporamas, '
                            'et écrans, le tout sur ce seul tableau de bord.')]
                    )
                  ],
                  classes: 'text'
              ),
              div(
                  [
                    h1(
                        [
                          FontAwesomeIcon(
                              icon: 'desktop',
                              classes: 'icon'
                          ),
                          text('Écrans : 1')
                        ],
                        classes: 'screen-count'
                    ),
                    progress(
                        [],
                        max: 100,
                        value: 75,
                        classes: 'progress-bar'
                    ),
                    p(
                        [text('Fin du service <strong>dans 5h</strong>', rawHtml: true)],
                        classes: 'time-left'
                    )
                  ],
                  classes: 'floating screen-stats'
              )
            ],
            classes: 'header'
        ),
        section(
          [
            h1(
                [text('Choisissez une section du panel administrateur :')],
                classes: 'choose-text'
            ),
            div(
              [
                Card(
                    title: 'Fichiers',
                    description: 'Sur cette partie du panneau de configuration, '
                        'vous serez amené à créer, éditer, supprimer et modifier'
                        ' les emplacements de vos fichiers.',
                    button: (label: "C'est parti !", href: '/files'),
                    classes: 'files'
                ),
                Card(
                    title: 'Animations',
                    description: 'Sur cette partie du panneau de configuration, '
                        'vous pourrez créer de nouveaux flux de données nommés '
                        'afin de les envoyer sur les écrans disponibles.',
                    button: (label: 'Allons-y !', href: '/animation-scheme'),
                    classes: 'animation-scheme'
                ),
                Card(
                    title: 'Écrans',
                    description: 'Sur cette partie du panneau de configuration, '
                        'vous pourrez modifier les propriétés de vos écrans, '
                        'telles que leurs tailles et leurs noms. Vous pourrez '
                        'aussi choisir le flux de données affiché par chaque '
                        'écran à votre guise.',
                    button: (label: 'Commençons !', href: '/screens'),
                    classes: 'screens'
                ),
              ],
              classes: 'cards'
            )
          ],
          classes: 'presentation'
        )
      ],
      id: 'landing-page'
    );
  }
}