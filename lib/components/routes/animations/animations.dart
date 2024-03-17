import 'package:jaspr/jaspr.dart';

import 'package:admin_panel/components/common/navigation_bar/navigation_bar.dart';


class AnimationsPage extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield SideNavigationMenu(index: 'animation-scheme');
  }
}