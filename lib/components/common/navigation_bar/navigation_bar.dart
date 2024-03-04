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
            LabeledComponent.extraClasses(
                classes: 'header',
                component: img(
                    src: 'assets/img/lycee.jpg',
                    classes: 'component'
                ),
                label: 'VSDB - Admin Panel',
                href: '/'
            ),
            LabeledComponent(
                component: FontAwesomeIcon.extraClasses(
                    icon: 'home',
                    classes: 'component'
                ),
                label: 'Accueil',
                href: '/',
                selected: index == 'home'
            ),
            LabeledComponent(
                component: FontAwesomeIcon.extraClasses(
                    icon: 'file',
                    classes: 'component'
                ),
                label: 'Fichiers',
                href: '/files',
                selected: index == 'files'
            ),
            LabeledComponent(
                component: FontAwesomeIcon.extraClasses(
                    icon: 'rainbow',
                    classes: 'component'
                ),
                label: 'Animations',
                href: '/animation-scheme',
                selected: index == 'animation-scheme'
            ),
            LabeledComponent(
                component: FontAwesomeIcon.extraClasses(
                    icon: 'desktop',
                    classes: 'component'
                ),
                label: 'Ecrans',
                href: '/screens',
                selected: index == 'screens'
            )
          ],
          id: 'nav-bar'
      )
    ];
  }
}