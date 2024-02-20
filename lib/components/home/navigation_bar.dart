import 'package:jaspr/jaspr.dart';

const marine = Color.rgb(15, 20, 35);
const darkMarine = Color.rgb(10, 10, 20);

class SidebarNavigation extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section([
      Header(),
      SidebarButton(ButtonIcon.selected('house'), 'Accueil', '/'),
      SidebarButton(ButtonIcon('folder'), 'Fichiers', '/files'),
      SidebarButton(ButtonIcon('desktop'), 'Ecrans', '/files')
    ],
    styles: Styles.combine([
        Styles.box(
          width: Unit.vw(25),
          height: Unit.vh(100),
          display: Display.flex,
          shadow: BoxShadow(offsetX: Unit.zero, offsetY: Unit.zero, blur: Unit.pixels(10)),
        ),
        Styles.flexbox(
            direction: FlexDirection.column,
            alignItems: AlignItems.center
        ),
        Styles.background(color: darkMarine)
      ])
    );
  }
}


class Header extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) {
    return [
      section([
        h1([
          FontAwesomeIcon(
              icon: 'sliders',
              styles: Styles.box(margin: EdgeInsets.only(right: Unit.pixels(15)))
          ),
          text('Menu - Admin Panel'),
        ],
            styles: Styles.text(color: Colors.white, fontWeight: FontWeight.lighter)
        ),
        CloseButton()
      ],
          styles: Styles.combine([
            Styles.flexbox(
                justifyContent: JustifyContent.spaceBetween,
                alignItems: AlignItems.center
            ),
            Styles.box(
                height: Unit.pixels(100),
                width: Unit.percent(80),
                padding: EdgeInsets.symmetric(horizontal: Unit.percent(10))
            ),
            Styles.background(color: marine)
          ])
      )
    ];
  }
}


class CloseButton extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => CloseButtonState();
}


class CloseButtonState extends State<CloseButton> {
  static const defaultTextColor = Colors.white;
  static const defaultBackgroundColor = darkMarine;
  static const defaultShadow = BoxShadow(offsetX: Unit.zero, offsetY: Unit.zero);

  Color textColor = defaultTextColor;
  Color backgroundColor = defaultBackgroundColor;
  BoxShadow shadow = defaultShadow;

  void hover() => setState(() {
    textColor = defaultBackgroundColor;
    backgroundColor = defaultTextColor;
    shadow = BoxShadow(
        offsetX: Unit.pixels(8),
        offsetY: Unit.pixels(8),
        color: darkMarine
    );
  });

  void leave() => setState(() {
    textColor = defaultTextColor;
    backgroundColor = defaultBackgroundColor;
    shadow = defaultShadow;
  });

  @override
  Iterable<Component> build(BuildContext context) {
    return [
      button([
        FontAwesomeIcon(
            icon: 'xmark',
            styles: Styles.text(
                fontSize: Unit.em(1.8),
                color: textColor
            )
        ),
      ],
          events: {
            'mouseover': (event) => hover(),
            'mouseleave': (event) => leave()
          },
          styles: SidebarState.defaultState.style
      )
    ];
  }
}


enum SidebarState {
  defaultState(Styles.combine([
      Styles.box(
        border: Border.all(BorderSide(width: Unit.zero)),
        width: Unit.pixels(50),
        height: Unit.pixels(50),
        radius: BorderRadius.circular(Unit.pixels(50)),
        transition: Transition('', duration: 200),
        cursor: Cursor.pointer
      ),
      Styles.background(color: marine)
    ])
  );

  final Styles style;

  const SidebarState(this.style);
}


class SidebarButton extends StatelessComponent {
  final ButtonIcon icon;
  final String content;
  final String redirection;

  SidebarButton(this.icon, this.content, this.redirection);

  @override
  Iterable<Component> build(BuildContext context) {
    return [
      a([
        icon,
        text(content)
      ],
      href: redirection,
      styles: Styles.combine([
          Styles.text(
              color: icon.textColor,
              decoration: TextDecoration(line: TextDecorationLine.none),
              fontFamily: FontFamily('Comfortaa'),
              fontSize: Unit.em(1.3),
          ),
          Styles.background(color: icon.backgroundColor),
          Styles.box(
              width: Unit.percent(96),
              padding: EdgeInsets.all(Unit.percent(2)),
              display: Display.flex,
              overflow: Overflow.hidden
          ),
          Styles.flexbox(alignItems: AlignItems.center)
        ])
      )
    ];
  }
}


class ButtonIcon extends StatelessComponent {
  final String icon;
  final Color textColor;
  final Color backgroundColor;

  ButtonIcon(this.icon)
      : textColor = Colors.white, backgroundColor = darkMarine;

  ButtonIcon.selected(this.icon)
      : textColor = darkMarine, backgroundColor = Colors.white;

  @override
  Iterable<Component> build(BuildContext context) {
    return [
      FontAwesomeIcon(
          icon: icon,
          styles: Styles.combine([
            Styles.box(
              margin: EdgeInsets.only(right: Unit.percent(5)),
              padding: EdgeInsets.all(Unit.pixels(15)),
            ),
            Styles.background(color: backgroundColor),
            Styles.text(color: textColor)
          ])
      )
    ];
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