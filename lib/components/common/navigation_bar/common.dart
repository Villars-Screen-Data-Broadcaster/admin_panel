import 'package:jaspr/jaspr.dart';


abstract class ClassesContainer extends StatelessComponent {
  final String classes;

  ClassesContainer(this.classes);
  ClassesContainer.extraClasses(String baseClasses, {required String classes}) : this('$baseClasses $classes');
}


class LabeledComponent extends ClassesContainer {
  final Component component;
  final String label;
  final String href;

  LabeledComponent({required this.component, required this.label, required this.href, required bool selected}) : super('labeled-component${selected ? ' selected' : ''}');
  LabeledComponent.extraClasses({required super.classes, required this.component, required this.label, required this.href}) : super.extraClasses('labeled-component');

  @override
  Iterable<Component> build(BuildContext context) {
    return [
      a(
          [
            component,
            p(
                [text(label)],
                classes: 'label'
            )
          ],
          href: href,
          classes: super.classes
      )
    ];
  }
}


class FontAwesomeIcon extends ClassesContainer {
  FontAwesomeIcon({String type = 'solid', required String icon}) : super('fa-$type fa-$icon');
  FontAwesomeIcon.extraClasses({String type = 'solid', required super.classes, required String icon}) : super.extraClasses('fa-$type fa-$icon');

  @override
  Iterable<Component> build(BuildContext context) {
    return [i([], classes: classes)];
  }
}