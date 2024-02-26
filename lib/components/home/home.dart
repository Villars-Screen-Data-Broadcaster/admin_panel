import 'package:jaspr/jaspr.dart';
import 'package:admin_panel/components/home/navigation_bar/navigation_bar.dart';

class HomePage extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield SidebarNavigation();
  }
}