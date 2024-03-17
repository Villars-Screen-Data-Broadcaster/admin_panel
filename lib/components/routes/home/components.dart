import 'package:jaspr/jaspr.dart';

import 'package:admin_panel/components/common/navigation_bar/common.dart';


typedef Button = ({String label, String href});

class Card extends ClassesContainer {
  final String title;
  final String description;
  final Button button;

  Card({required this.title, required this.description, required this.button, required super.classes}) : super.extraClasses('floating card');

  @override
  Iterable<Component> build(BuildContext context) {
    return [
      div(
          [
            h1(
                [text(title)],
                classes: 'title'
            ),
            p(
                [text(description)],
                classes: 'description'
            ),
            a(
                [text(button.label)],
                href: button.href,
                classes: 'floating redirect'
            )
          ],
          classes: super.classes
      )
    ];
  }
}