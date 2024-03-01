import 'package:jaspr/jaspr.dart';


Component table(List<Component> children, {Styles? styles}) => DomComponent(tag: 'table', children: children, styles: styles);

Component thead(List<Component> children, {Styles? styles}) => DomComponent(tag: 'thead', children: children, styles: styles);
Component tbody(List<Component> children, {Styles? styles}) => DomComponent(tag: 'tbody', children: children, styles: styles);
Component tfoot(List<Component> children, {Styles? styles}) => DomComponent(tag: 'tfoot', children: children, styles: styles);

Component tr(List<Component> children, {Styles? styles}) => DomComponent(tag: 'tr', children: children, styles: styles);
Component th(List<Component> children, {String scope = 'row', Styles? styles}) => DomComponent(tag: 'th', attributes: {'scope': scope}, children: children, styles: styles);
Component td(List<Component> children, {Styles? styles}) => DomComponent(tag: 'td', children: children, styles: styles);