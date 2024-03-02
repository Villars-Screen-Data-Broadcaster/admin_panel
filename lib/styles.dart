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
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero
      ),
    ]),
  ),
  StyleRule(selector: Selector.tag('html'), styles: Styles.box(
    margin: EdgeInsets.only(left: Unit.pixels(100)),
  )),
  StyleRule(selector: Selector.tag('body'), styles: Styles.box(
    padding: EdgeInsets.all(Unit.pixels(50)),
  ))
];
