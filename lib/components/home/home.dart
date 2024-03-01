import 'package:jaspr/jaspr.dart';

import '../common/navigation_bar/navigation_bar.dart';
import '../common/static_components.dart';
import '../common/native_components.dart';


class HomePage extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield SideNavigationMenu();

    yield PageHeader(
        icon: 'sliders',
        title: 'Accueil - Admin Panel | Villars Screen Data Broadcaster',
        description: const [
          "Bienvenue sur le panel d'administration du VSDB !",
          "NONE",
          "Sur ce panel, de nombreux choix s'offrent a vous, comme celui de configurer de nouveaux ecrans ainsi que leurs proprietes,",
          "ajouter et supprimer de nouveaux dossiers et fichiers, changer leurs emplacements et leurs noms, etc..."
        ]
    );

    const headerStyle = Styles.text(
        fontSize: Unit.em(1.5)
    );

    // TODO: Add style (it's ugly rn)
    yield table(
      [
        thead([tr(
            [
              th(
                  [text('Ecrans')],
                  scope: 'col',
                  styles: headerStyle
              ),
              th(
                  [text('Fichiers')],
                  scope: 'col',
                  styles: headerStyle
              )
            ],
          )],
        ),
        tbody([
          tr([
            td(
                [
                  p([text("Gestion d'ecrans : noms, tailles, contenus multimedia... c'est par ici !")]),
                  _HoverableButton('Allons-y !', href: '/screens', bgColor: Color.hex('#49b7f3'), hoverBgColor: Color.hex('#398dba'))
                ]
            ),
            td(
                [
                  p([text("Gestion de fichiers : noms, emplacements... c'est par la !")]),
                  _HoverableButton("C'est parti !", href: '/files', bgColor: Color.hex('#f13c3c'), hoverBgColor: Color.hex('#d53535'))
                ]
            )
          ])
        ])
      ]
    );
  }
}

// TODO: Maybe move this class outside this home file.
class _HoverableButton extends StatefulComponent {
  final String label;
  final String href;
  final Color bgColor;
  final Color hoverBgColor;

  _HoverableButton(this.label, {required this.href, required this.bgColor, required this.hoverBgColor});

  @override
  State<StatefulComponent> createState() => _HoverableButtonState(label, href, bgColor, hoverBgColor);
}

class _HoverableButtonState extends State<_HoverableButton> {
  final String label;
  final String href;
  final Color bgColor;
  final Color hoverBgColor;

  Color currentBgColor;

  _HoverableButtonState(this.label, this.href, this.bgColor, this.hoverBgColor)
      : currentBgColor = bgColor;

  void hover() => setState(() {
    currentBgColor = hoverBgColor;
  });

  void unhover() => setState(() {
    currentBgColor = bgColor;
  });

  @override
  Iterable<Component> build(BuildContext context) {
    return [
      a(
          [text(label)],
          href: href,
          styles: Styles.combine([
            Styles.text(
                color: Colors.white,
                decoration: TextDecoration(line: TextDecorationLine.none)
            ),
            Styles.box(
                padding: EdgeInsets.all(Unit.pixels(15)),
                radius: BorderRadius.all(Radius.circular(Unit.pixels(4))),
                transition: Transition('', duration: 150)
            ),
            Styles.background(color: currentBgColor)
          ]),
          events: {
            'mouseover': (event) => hover(),
            'mouseleave': (event) => unhover(),
          }
      )
    ];
  }
}