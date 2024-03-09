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
      ),
      link(href: 'assets/img/admin.png', rel: 'icon', type: 'image/png'),
      link(href: 'assets/css/common_styles.css', rel: 'stylesheet', type: 'text/css'),
      link(href: 'assets/css/navigation_bar.css', rel: 'stylesheet', type: 'text/css'),
      link(href: 'assets/css/home.css', rel: 'stylesheet', type: 'text/css'),
      link(href: 'assets/css/files.css', rel: 'stylesheet', type: 'text/css'),

      script([], src: 'assets/js/files.js', defer: true)
    ],
    body: App(),
  ));
}
