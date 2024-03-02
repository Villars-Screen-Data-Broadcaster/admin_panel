import 'package:jaspr/jaspr.dart';

import '../common/navigation_bar/navigation_bar.dart';
import '../common/static_components.dart';


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

    yield Table(
        columns: {
          'Ecrans': TableRowWithButton(
              description: "Gestion d'ecrans : noms, tailles, contenus multimedia... c'est par ici !",
              button: HoverableButton('Allons-y !', href: '/screens', bgColor: Color.hex('#49b7f3'), hoverBgColor: Color.hex('#398dba'))
          ),
          'Fichiers': TableRowWithButton(
              description: "Gestion de fichiers : noms, emplacements... c'est par la !",
              button: HoverableButton("C'est parti !", href: '/files', bgColor: Color.hex('#f13c3c'), hoverBgColor: Color.hex('#d53535'))
          ),
        },
        styles: Styles.box(
            width: Unit.percent(100),
            height: Unit.percent(40)
        )
    );
  }
}