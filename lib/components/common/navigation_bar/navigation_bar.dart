import 'package:admin_panel/components/common/navigation_bar/common.dart';
import 'package:jaspr/jaspr.dart';


class SideNavigationMenu extends StatelessComponent {
  final String index;

  SideNavigationMenu({required this.index});

  @override
  Iterable<Component> build(BuildContext context) {
    return [
      section(
          [
            div(
                [
                  LabeledComponent.extraClasses(
                      classes: 'header',
                      component: img(
                          src: 'assets/img/lycee.jpg',
                          classes: 'component'
                      ),
                      label: 'VSDB - Panel Administrateur',
                      href: '/'
                  ),
                  LabeledComponent(
                      component: FontAwesomeIcon(
                          icon: 'home',
                          classes: 'component'
                      ),
                      label: 'Accueil',
                      href: '/',
                      selected: index == 'home'
                  ),
                  LabeledComponent(
                      component: FontAwesomeIcon(
                          icon: 'file',
                          classes: 'component'
                      ),
                      label: 'Fichiers',
                      href: '/files',
                      selected: index == 'files'
                  ),
                  LabeledComponent(
                      component: FontAwesomeIcon(
                          icon: 'rainbow',
                          classes: 'component'
                      ),
                      label: 'Animations',
                      href: '/animation-scheme',
                      selected: index == 'animation-scheme'
                  ),
                  LabeledComponent(
                      component: FontAwesomeIcon(
                          icon: 'desktop',
                          classes: 'component'
                      ),
                      label: 'Écrans',
                      href: '/screens',
                      selected: index == 'screens'
                  )
                ]
            ),
            section(
              [p([text('Villars Screen Data Broadcaster - &copy; 2024 Arthur BARBERA', rawHtml: true)])],
              classes: 'nav-bar-footer'
            )
          ],
          id: 'nav-bar'
      )
    ];
  }
}