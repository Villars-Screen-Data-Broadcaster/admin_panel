import 'package:admin_panel/components/common/navigation_bar/sections.dart';
import 'package:jaspr/jaspr.dart';

import 'common.dart';
import 'header.dart';


class SideNavigationMenu extends ZippableComponent {
  SideNavigationMenu(String index) : super(_SideNavigationMenuState(index));
}

class _SideNavigationMenuState extends ZippableComponentState {
  final List<ZippableComponent> _components;
  Unit _width;

  _SideNavigationMenuState(String index)
      : _components = [
            Header(),
            index == 'home'
                ? Section.selected(
                    icon: 'home',
                    label: 'Accueil',
                    href: '/'
                )
                : Section(
                    icon: 'home',
                    label: 'Accueil',
                    href: '/'
                ),
            index == 'files'
                ? Section.selected(
                    icon: 'file',
                    label: 'Fichiers',
                    href: '/files',
                    index: 2
                )
                : Section(
                    icon: 'file',
                    label: 'Fichiers',
                    href: '/files',
                    index: 2
                ),
            index == 'screens'
                ? Section.selected(
                    icon: 'desktop',
                    label: 'Ecrans',
                    href: '/screens',
                    index: 3
                )
                : Section(
                    icon: 'desktop',
                    label: 'Ecrans',
                    href: '/screens',
                    index: 3
                )
        ],
        _width = Unit.pixels(100);

  @override
  Iterable<Component> build(BuildContext context) {
    return [
      section(
          _components,
          styles: Styles.combine([
            Styles.box(
                width: _width,
                height: Unit.vh(100),
                display: Display.flex,
                position: Position.fixed(top: Unit.zero, left: Unit.zero),
                transition: Transition('', duration: transition)
            ),
            Styles.flexbox(direction: FlexDirection.column),
            Styles.background(color: darkMarine)
          ]),
          events: {
            'mouseover': (event) => unzip(),
            'mouseleave': (event) => zip(),
          }
      )
    ];
  }

  @override
  void unzip() => setState(() {
    _width = Unit.vw(25);

    for (var component in _components) {
      component.unzip();
    }
  });

  @override
  void zip() => setState(() {
    _width = Unit.pixels(100);

    for (var component in _components) {
      component.zip();
    }
  });
}