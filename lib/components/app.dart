import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'home.dart';
import 'files.dart';
import 'animation_scheme.dart';
import 'screens.dart';

@client
class App extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Router(routes: [
      Route(path: '/', builder: (context, state) => HomePage()),
      Route(path: '/files', builder: (context, state) => FilesPage()),
      Route(path: '/animation-scheme', builder: (context, state) => AnimationSchemePage()),
      Route(path: '/screens', builder: (context, state) => ScreensPage()),
    ]);
  }
}
