import 'package:admin_panel/components/home/home.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

@client
class App extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Router(routes: [
      Route(path: '/', builder: (context, state) => HomePage()),
    ]);
  }
}
