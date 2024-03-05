import 'package:jaspr/jaspr.dart';

/// The main styles for this app.
const styles = [
  StyleRule.import('https://fonts.googleapis.com/css?family=Roboto'),
  StyleRule.fontFace(fontFamily: 'Comfortaa', url: 'assets/font/Comfortaa-Light.ttf'),
  StyleRule.fontFace(fontFamily: 'Ubuntu', url: 'assets/font/Ubuntu-Regular.ttf'),
  StyleRule(
    // Applies these styles to the html and body elements.
    selector: Selector.list([Selector.tag('html'), Selector.tag('body')]),
    styles: Styles.box(
        width: Unit.auto,
        height: Unit.percent(100),
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero
    )
  ),
];
