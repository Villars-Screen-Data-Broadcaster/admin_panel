import 'package:jaspr/jaspr.dart';

/// The main styles for this app.
const styles = [
  StyleRule.import('https://fonts.googleapis.com/css?family=Roboto'),
  StyleRule.fontFace(fontFamily: 'Comfortaa', url: 'assets/font/Comfortaa-Light.ttf'),
  StyleRule(
    // Applies these styles to the html and body elements.
    selector: Selector.list([Selector.tag('html'), Selector.tag('body')]),
    styles: Styles.combine([
      Styles.text(
        fontFamily: FontFamily.list([FontFamily('Roboto'), FontFamilies.sansSerif]),
      ),
      Styles.box(
        width: Unit.auto,
        height: Unit.percent(100),
        margin: EdgeInsets.only(left: Unit.pixels(100)),
        padding: EdgeInsets.zero,
      ),
    ]),
  ),
];
