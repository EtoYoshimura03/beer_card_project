import 'package:flutter/widgets.dart';

abstract class BeerImages {
  static const viechtacherWeissbier =
      AssetImage('images/viechtacher_weissbier.png');
  static const polsterbrauWeissbier =
      AssetImage('images/polsterbrau_weissbier.png');
  static const gloanerPfahlbock = AssetImage('images/gloaner_pfahlbock.png');
  static const viechtacherZwickl = AssetImage('images/viechtacher_zwickl.png');
  static const woltersMaiBock = AssetImage('images/wolters_mai_bock.png');
  static const stortebekerRoggenWeizen =
      AssetImage('images/stortebeker_roggen_weizen.png');
  static const polsterbrauGuldenPils =
      AssetImage('images/polsterbrau_gulden_pils.png');
  static const treuenerBock = AssetImage('images/wolters_mai_bock.png');
  static const woltersMalz = AssetImage('images/wolters_malz.png');
  static const treuenerPilsner = AssetImage('images/treuener_pilsner.png');
  static const beerCult = AssetImage('images/beer_cult@2x.png');

  static const List<AssetImage> images = [
    viechtacherWeissbier,
    polsterbrauWeissbier,
    gloanerPfahlbock,
    viechtacherZwickl,
    woltersMaiBock,
    stortebekerRoggenWeizen,
    polsterbrauGuldenPils,
    treuenerBock,
    woltersMalz,
    treuenerPilsner,
    beerCult
  ];
}
