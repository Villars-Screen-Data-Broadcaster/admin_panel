import 'package:jaspr/jaspr.dart';


/// Colors
const marine = Color.rgb(15, 20, 35);
const darkMarine = Color.rgb(10, 10, 20);


/// Styles
const Styles leftComponentStyle = Styles.combine([
  Styles.box(
      width: Unit.percent(50),
      height: Unit.percent(50),
      display: Display.flex,
      radius: BorderRadius.circular(Unit.pixels(5))
  ),
  Styles.flexbox(
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center
  )
]);

const double transition = 150;


/// Component Types

// Zippable Components
abstract class _Zippable {
  void zip();
  void unzip();
}

class ZippableComponent extends StatefulComponent implements _Zippable {
  final ZippableComponentState _state;

  ZippableComponent(ZippableComponentState state) : _state = state;

  @override
  State<StatefulComponent> createState() => _state;

  @override
  void zip() {
    _state.zip();
  }

  @override
  void unzip() {
    _state.unzip();
  }
}

abstract class ZippableComponentState extends State<ZippableComponent> implements _Zippable {
}

// Labeled Components
class LabeledComponent extends ZippableComponent {
  LabeledComponent({required String href, required Component component, required String label, double fontSize = 1.15, Color backgroundColor = darkMarine, required double transitionDelay, double transition = transition})
      : super(_LabeledComponentState(href, ComponentFrame(component), label, fontSize, backgroundColor, transitionDelay, transition));
}

class _LabeledComponentState extends ZippableComponentState {
  final String _href;
  final ComponentFrame _componentFrame;
  final String _text;
  final double _fontSize;
  final Color _backgroundColor;
  final double _transitionDelay;
  final double _transition;
  Component _label;

  _LabeledComponentState(this._href, this._componentFrame, this._text, this._fontSize, this._backgroundColor, this._transitionDelay, this._transition)
      : _label = a(
      [text(_text)],
      href: _href,
      styles: Styles.box(
          position: Position.absolute(),
          transform: Transform.translate(x: Unit.pixels(-100)),
          opacity: 0.0
      )
  );

  @override
  Iterable<Component> build(BuildContext context) {
    return [section(
        [
          _componentFrame,
          _label
        ],
        styles: Styles.combine([
          Styles.box(
              width: Unit.percent(100),
              height: Unit.pixels(100),
              display: Display.flex
          ),
          Styles.flexbox(alignItems: AlignItems.center),
          Styles.background(color: _backgroundColor)
        ])
    )];
  }

  @override
  void zip() {
    setState(() {
      _label = a(
          [text(_text)],
          href: _href,
          styles: Styles.box(
              position: Position.absolute(),
              transform: Transform.translate(x: Unit.pixels(-100)),
              opacity: 0.0
          )
      );
    });
  }

  @override
  void unzip() {
    setState(() {
      _label = a(
          [text(_text)],
          href: _href,
          styles: Styles.combine([
            Styles.text(
                color: Colors.white,
                fontFamily: FontFamily('Comfortaa'),
                fontSize: Unit.em(_fontSize),
                decoration: TextDecoration(line: TextDecorationLine.none)
            ),
            Styles.box(
                position: Position.absolute(left: Unit.pixels(100)),
                transition: Transition('', duration: _transition, delay: _transitionDelay)
            ),
            Styles.raw({'user-select': 'none'})
          ])
      );
    });
  }
}

// Components in Frames
class ComponentFrame extends StatelessComponent {
  final Component _component;

  const ComponentFrame(this._component);

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(
        [_component],
        styles: Styles.combine([
          Styles.box(
              width: Unit.pixels(100),
              height: Unit.pixels(100),
              display: Display.flex
          ),
          Styles.flexbox(
              alignItems: AlignItems.center,
              justifyContent: JustifyContent.center
          )
        ])
    );
  }
}

// FontAwesome icon
class FontAwesomeIcon extends StatelessComponent {
  final String icon;
  final Styles? styles;

  factory FontAwesomeIcon({required String icon, Styles? styles}) {
    return FontAwesomeIcon._internal(type: 'solid', icon: icon, styles: styles);
  }

  factory FontAwesomeIcon.regular({required String icon, Styles? styles}) {
    return FontAwesomeIcon._internal(type: 'regular', icon: icon, styles: styles);
  }

  const FontAwesomeIcon._internal({required String type, required String icon, this.styles})
      : icon = 'fa-$type fa-$icon';

  @override
  Iterable<Component> build(BuildContext context) {
    return [
      styles == null
          ? i([], classes: icon)
          : i([], classes: icon, styles: styles)
    ];
  }
}