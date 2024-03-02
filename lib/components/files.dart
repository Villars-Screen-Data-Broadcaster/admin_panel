import 'package:jaspr/jaspr.dart';

import 'common/navigation_bar/navigation_bar.dart';


class FilesPage extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield SideNavigationMenu('files');
  }
}