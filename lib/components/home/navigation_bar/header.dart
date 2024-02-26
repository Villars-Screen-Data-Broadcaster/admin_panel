import 'package:jaspr/jaspr.dart';

import 'common.dart';


class Header extends LabeledComponent {
  Header() : super(
      component: img(src: 'assets/img/lycee.jpg', styles: leftComponentStyle),
      label: 'VSBD - Admin Panel',
      fontSize: 1.3
  );
}