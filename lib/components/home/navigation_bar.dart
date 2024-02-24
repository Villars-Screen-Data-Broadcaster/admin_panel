import 'package:jaspr/jaspr.dart';


// Colors
const marine = Color.rgb(15, 20, 35);
const darkMarine = Color.rgb(10, 10, 20);


// Styles
const Styles leftComponentStyle = Styles.combine([
  Styles.box(
      width: Unit.percent(50),
      height: Unit.percent(50),
      display: Display.flex,
      radius: BorderRadius.circular(Unit.pixels(5))
  )
]);

const Styles rightComponentStyle = Styles.combine([

]);


class SidebarNavigation extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) {
    return [
      section(
        [
          Header()
        ],
        styles: Styles.combine([
          Styles.box(
              width: Unit.vw(25),
              height: Unit.vh(100),
              display: Display.flex
          ),
          Styles.flexbox(justifyContent: JustifyContent.center),
          Styles.background(color: darkMarine)
        ])
      )
    ];
  }
}


class Header extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) {
    return [section( // ComponentPair
      [
        LeftComponentWrapper(img(src: 'assets/img/lycee.jpg', styles: leftComponentStyle)),
        p(
          [text('VSBD - Admin Panel')],
          styles: Styles.combine([
            Styles.text(
                color: Colors.white,
                fontFamily: FontFamily('Comfortaa'),
                fontSize: Unit.em(1.3)
            ),
            Styles.raw({'user-select': 'none'})
          ])
        )
        // RightComponentWrapper(h1([text('VSBD - Admin Panel')]))
      ],
      styles: Styles.combine([
        Styles.box(
            width: Unit.percent(100),
            height: Unit.pixels(100),
            display: Display.flex
        ),
        Styles.flexbox(alignItems: AlignItems.center),
        Styles.background(color: marine)
      ])
    )];
  }
}


// class ComponentPair


class LeftComponentWrapper extends StatelessComponent {
  final Component _component;

  LeftComponentWrapper(this._component);

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