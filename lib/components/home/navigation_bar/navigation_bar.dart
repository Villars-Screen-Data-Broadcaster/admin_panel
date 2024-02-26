import 'package:jaspr/jaspr.dart';

import 'common.dart';
import 'header.dart';


class SidebarNavigation extends ZippableComponent {
  SidebarNavigation() : super(_SidebarNavigationState());
}

class _SidebarNavigationState extends ZippableComponentState {
  final List<ZippableComponent> _components;
  Unit _width;

  _SidebarNavigationState()
      : _components = [Header()],
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