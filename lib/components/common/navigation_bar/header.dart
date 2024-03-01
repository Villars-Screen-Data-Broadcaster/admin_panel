import 'package:jaspr/jaspr.dart';

import 'common.dart';


class Header extends LabeledComponent {
  Header() : super(
      href: '',
      component: img(src: 'assets/img/lycee.jpg', styles: leftComponentStyle),
      label: 'VSDB - Admin Panel',
      fontSize: 1.3,
      backgroundColor: marine,
      transitionDelay: transition
  );
}