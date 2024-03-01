import 'package:admin_panel/components/common/navigation_bar/common.dart';
import 'package:jaspr/jaspr.dart';


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