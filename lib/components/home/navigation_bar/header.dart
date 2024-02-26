import 'package:jaspr/jaspr.dart';

import 'common.dart';


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