


import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:myfirstgame/engine/loader/EnumImages.dart';

class ImageLoader

{
  static Map<EnumImages, Sprite> sprites  = {};


  @override
  Future<void> load() async {
    print("Beginne mit dem Laden der Images");

    //UI
    sprites[EnumImages.UICardOne] = Sprite(await Flame.images.load('elements/normal/UICard1.png'));
    sprites[EnumImages.UICardOneStripe] = Sprite(await Flame.images.load('elements/normal/UICard1Stripe.png'));
    sprites[EnumImages.UICardTwo] = Sprite(await Flame.images.load('elements/normal/UICard2.png'));
    sprites[EnumImages.UICardThree] = Sprite(await Flame.images.load('elements/normal/UICard3.png'));
    sprites[EnumImages.UICardFour] = Sprite(await Flame.images.load('elements/normal/UICard4.png'));
    sprites[EnumImages.UIIconCell] = Sprite(await Flame.images.load('elements/normal/IconCell.png'));
    sprites[EnumImages.UICellShipfractions] = Sprite(await Flame.images.load('elements/normal/CellSpaceshipFraction.png'));
    sprites[EnumImages.UIStatesPanel] = Sprite(await Flame.images.load('elements/normal/StatesPanel.png'));
    sprites[EnumImages.UIIconCellTwo] = Sprite(await Flame.images.load('elements/normal/IconCell2.png'));
    sprites[EnumImages.UIButtonOne] = Sprite(await Flame.images.load('elements/normal/Btn1.png'));
    sprites[EnumImages.UIDiscord] = Sprite(await Flame.images.load('elements/normal/discord.png'));

    //Icons
    sprites[EnumImages.IconBook] = Sprite(await Flame.images.load('elements/normal/Book.png'));
    sprites[EnumImages.IconGearSettings] = Sprite(await Flame.images.load('elements/normal/Gear.png'));
    sprites[EnumImages.IconTrophy] = Sprite(await Flame.images.load('elements/normal/Trophy.png'));


    //Icons Fractions
    sprites[EnumImages.IconRepublic] = Sprite(await Flame.images.load('elements/normal/shipfraction/Republic.jpg'));
    sprites[EnumImages.IconImperium] = Sprite(await Flame.images.load('elements/normal/shipfraction/Imperium.jpg'));
    sprites[EnumImages.IconRebellen] = Sprite(await Flame.images.load('elements/normal/shipfraction/Rebellen.jpg'));
    sprites[EnumImages.IconSeperatisten] = Sprite(await Flame.images.load('elements/normal/shipfraction/Seperatisten.jpg'));
    //Ships
    //Ships Imperium
    //Ships Republic
    //Ships Seperatisten
    //Ships Rebellen
    //Ships Alien (other)
    sprites[EnumImages.AlienShipOne] = Sprite(await Flame.images.load('ships/normal/other/AlienShip1.png'));
    //Laser
    sprites[EnumImages.LaserOne] = Sprite(await Flame.images.load('laser/normal/Laser1.png'));




    print("Ende mit dem Laden der Images");

  }


}