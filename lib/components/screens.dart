import 'package:jaspr/jaspr.dart';

import 'common/navigation_bar/navigation_bar.dart';


class ScreensPage extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield SideNavigationMenu(index: 'screens');
  }
}