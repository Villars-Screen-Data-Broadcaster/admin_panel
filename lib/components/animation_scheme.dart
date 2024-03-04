import 'package:admin_panel/components/common/navigation_bar/navigation_bar.dart';
import 'package:jaspr/jaspr.dart';


class AnimationSchemePage extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield SideNavigationMenu(index: 'animation-scheme');
  }
}