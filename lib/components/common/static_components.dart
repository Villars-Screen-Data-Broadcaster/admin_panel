import 'package:jaspr/jaspr.dart';

import 'native_components.dart';
import 'navigation_bar/common.dart';


class PageHeader extends StatelessComponent {
  final FontAwesomeIcon _icon;
  final String _title;
  final _PageHeaderDescription _description;

  PageHeader({required String icon, required String title, required List<String> description})
      : _icon = FontAwesomeIcon(
          icon: icon,
          styles: Styles.box(margin: EdgeInsets.only(right: Unit.pixels(15)))
      ),
        _title = title,
        _description = _PageHeaderDescription(description);

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(
      [
        h1(
          [
            _icon,
            text(_title)
          ],
          styles: Styles.text(fontSize: Unit.em(1.8))
        ),
        _description,
        hr(styles: Styles.box(
            margin: EdgeInsets.symmetric(vertical: Unit.pixels(50)),
            width: Unit.percent(80)
        ))
      ],
      styles: const Styles.raw({'user-select': 'none'})
    );
  }
}

class _PageHeaderDescription extends StatelessComponent {
  final List<Component> _lines;

  _PageHeaderDescription(List<String> lines)
      : _lines = lines.map((line) => p(
          [text(line)],
          styles: Styles.combine([
            Styles.text(
                color: line == "NONE" ? Colors.white : Colors.gray,
                fontStyle: FontStyle.italic,
                fontSize: Unit.em(1.2)
            ),
            Styles.box(margin: EdgeInsets.zero)
          ])
      )).toList();

  @override
  Iterable<Component> build(BuildContext context) {
    return [
      section(
          _lines,
          styles: const Styles.combine([
            Styles.box(
                padding: EdgeInsets.only(left: Unit.pixels(15)),
                shadow: BoxShadow.inset(offsetX: Unit.pixels(5), offsetY: Unit.zero, color: Colors.darkGray),
                radius: BorderRadius.only(
                    topLeft: Radius.circular(Unit.pixels(2)),
                    bottomLeft: Radius.circular(Unit.pixels(2)),
                )
            )
          ])
      )
    ];
  }
}

class Table extends StatelessComponent {
  final Component _thead;
  final Component _tbody;
  final Styles? _styles;

  Table({required Map<String, TableRowWithButton> columns, Styles? styles})
      : _thead = thead([
          tr([
            for (var header in columns.keys)
              th(
                  [text(header)],
                  scope: 'col',
                  styles: Styles.combine([
                    Styles.text(fontSize: Unit.em(1.5)),
                    Styles.background(color: Colors.lightGrey)
                  ])
              )
          ])
        ]),
        _tbody = tbody([tr(columns.values.toList())]),
        _styles = styles;

  @override
  Iterable<Component> build(BuildContext context) {
    return [
      table([_thead, _tbody], styles: _styles)
    ];
  }
}

class TableRowWithButton extends StatelessComponent {
  final Component _description;
  final HoverableButton _button;

  TableRowWithButton({required String description, required HoverableButton button})
      : _description = p([text(description)], styles: Styles.box(margin: EdgeInsets.only(bottom: Unit.pixels(50)))),
        _button = button;

  @override
  Iterable<Component> build(BuildContext context) {
    return [
      td(
          [_description, _button],
          styles: Styles.combine([
            Styles.text(align: TextAlign.center),
            Styles.box(border: Border.all(BorderSide(
                style: BorderStyle.solid,
                color: Colors.lightSlateGray,
                width: Unit.pixels(2)
            )))
          ])
      )
    ];
  }

}

class HoverableButton extends StatefulComponent {
  final String label;
  final String href;
  final Color bgColor;
  final Color hoverBgColor;

  HoverableButton(this.label, {required this.href, required this.bgColor, required this.hoverBgColor});

  @override
  State<StatefulComponent> createState() => _HoverableButtonState(label, href, bgColor, hoverBgColor);
}

class _HoverableButtonState extends State<HoverableButton> {
  final String label;
  final String href;
  final Color bgColor;
  final Color hoverBgColor;

  Color currentBgColor;

  _HoverableButtonState(this.label, this.href, this.bgColor, this.hoverBgColor)
      : currentBgColor = bgColor;

  void hover() => setState(() {
    currentBgColor = hoverBgColor;
  });

  void unhover() => setState(() {
    currentBgColor = bgColor;
  });

  @override
  Iterable<Component> build(BuildContext context) {
    return [
      a(
          [text(label)],
          href: href,
          styles: Styles.combine([
            Styles.text(
                color: Colors.white,
                decoration: TextDecoration(line: TextDecorationLine.none)
            ),
            Styles.box(
                padding: EdgeInsets.all(Unit.pixels(15)),
                radius: BorderRadius.all(Radius.circular(Unit.pixels(4))),
                transition: Transition('', duration: 150)
            ),
            Styles.background(color: currentBgColor)
          ]),
          events: {
            'mouseover': (event) => hover(),
            'mouseleave': (event) => unhover(),
          }
      )
    ];
  }
}