import 'package:jaspr/jaspr.dart';
import 'package:admin_panel/components/home/navigation_bar/common.dart';


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


class Header extends ZippableComponent {
  Header() : super(_HeaderState());
}

class _HeaderState extends ZippableComponentState {
  final LabeledComponent _component;

  _HeaderState() : _component = LabeledComponent(
      component: img(src: 'assets/img/lycee.jpg', styles: leftComponentStyle),
      label: 'VSBD - Admin Panel',
      fontSize: 1.3
  );

  @override
  void zip() => setState(() {
    _component.zip();
  });

  @override
  void unzip() => setState(() {
    _component.unzip();
  });

  @override
  Iterable<Component> build(BuildContext context) {
    return [section( // ComponentPair
        [_component],
        styles: Styles.combine([
          Styles.box(
              width: Unit.percent(100),
              height: Unit.pixels(100),
              display: Display.flex,
              position: Position.relative()
          ),
          Styles.flexbox(alignItems: AlignItems.center),
          Styles.background(color: marine)
        ])
    )];
  }
}