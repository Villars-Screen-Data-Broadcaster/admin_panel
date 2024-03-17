import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'package:admin_panel/components/routes/home/home.dart';
import 'package:admin_panel/components/routes/files/files.dart';
import 'package:admin_panel/components/routes/animations/animations.dart';
import 'package:admin_panel/components/routes/screens/screens.dart';


@client
class App extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Router(routes: [
      Route(path: '/', builder: (context, state) => HomePage()),
      Route(path: '/files', builder: (context, state) => FilesPage()),
      Route(path: '/animation-scheme', builder: (context, state) => AnimationsPage()),
      Route(path: '/screens', builder: (context, state) => ScreensPage()),
    ]);
  }
}
