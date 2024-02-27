import 'package:jaspr/jaspr.dart';

import 'common.dart';


class Section extends LabeledComponent {
  Section({required String icon, required String label, required String href, int index = 1}) : super(
      href: href,
      component: FontAwesomeIcon(
          icon: icon,
          styles: Styles.combine([
            leftComponentStyle,
            Styles.text(
                color: Colors.white,
                fontSize: Unit.em(1.7)
            )
          ])
      ),
      label: label,
      transitionDelay: (index + 1) * transition
  );

  Section.selected({required String icon, required String label, required String href, int index = 1}) : super(
      href: href,
      component: FontAwesomeIcon(
          icon: icon,
          styles: Styles.combine([
            leftComponentStyle,
            Styles.text(
                color: marine,
                fontSize: Unit.em(1.7)
            ),
            Styles.background(color: Colors.white)
          ])
      ),
      label: label,
      transitionDelay: (index + 1) * transition
  );
}