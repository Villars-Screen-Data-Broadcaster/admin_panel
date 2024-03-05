import 'package:admin_panel/components/common/navigation_bar/common.dart';
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
        img(
            src: 'assets/img/home-header-wave.svg',
            classes: 'wave-separator'
        )
      ],
      id: 'landing-page'
    );
  }
}