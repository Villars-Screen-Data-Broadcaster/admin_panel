import 'package:jaspr/server.dart';

import 'components/app.dart';
import 'jaspr_options.dart';
import 'styles.dart';

void main() {
  Jaspr.initializeApp(
    options: defaultJasprOptions,
  );

  runApp(Document(
    title: 'Admin Panel - Screen Data Broadcaster',
    styles: styles,
    head: [
      script([],
          src: 'https://kit.fontawesome.com/3198643e95.js',
          attributes: {'crossorigin': 'anonymous'}
      )
    ],
    body: App(),
  ));
}
