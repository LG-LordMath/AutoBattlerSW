


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
    sprites[EnumImages.UIIconCellThree] = Sprite(await Flame.images.load('elements/normal/IconCell3.png'));
    sprites[EnumImages.UIButtonOne] = Sprite(await Flame.images.load('elements/normal/Btn1.png'));
    sprites[EnumImages.UIDiscord] = Sprite(await Flame.images.load('elements/normal/discord.png'));
    sprites[EnumImages.UIGameFieldOne] = Sprite(await Flame.images.load('elements/normal/GameField.png'));
    //Icons
    sprites[EnumImages.IconBook] = Sprite(await Flame.images.load('elements/normal/Book.png'));
    sprites[EnumImages.IconGearSettings] = Sprite(await Flame.images.load('elements/normal/Gear.png'));
    sprites[EnumImages.IconTrophy] = Sprite(await Flame.images.load('elements/normal/Trophy.png'));
    sprites[EnumImages.IconCredits] = Sprite(await Flame.images.load('elements/normal/IconCredits.png'));
    sprites[EnumImages.IconLoading] = Sprite(await Flame.images.load('elements/normal/Iconpfeil.png'));
    sprites[EnumImages.IconStar] = Sprite(await Flame.images.load('elements/normal/Star.png'));
    //Icons Fractions
    sprites[EnumImages.IconRepublic] = Sprite(await Flame.images.load('elements/normal/shipfraction/Republic.jpg'));
    sprites[EnumImages.IconImperium] = Sprite(await Flame.images.load('elements/normal/shipfraction/Imperium.jpg'));
    sprites[EnumImages.IconRebellen] = Sprite(await Flame.images.load('elements/normal/shipfraction/Rebellen.jpg'));
    sprites[EnumImages.IconSeperatisten] = Sprite(await Flame.images.load('elements/normal/shipfraction/Seperatisten.jpg'));
    //Ships
    //Ships Imperium
    sprites[EnumImages.ShipEmpireTie] = Sprite(await Flame.images.load('ships/normal/imperium/Tie.png'));
    sprites[EnumImages.ShipEmpireTieBomber] = Sprite(await Flame.images.load('ships/normal/imperium/TieBomber.png'));
    sprites[EnumImages.ShipEmpireTieIntercepter] = Sprite(await Flame.images.load('ships/normal/imperium/TieAbfangjäger.png'));
    sprites[EnumImages.ShipEmpireDeltaClass] = Sprite(await Flame.images.load('ships/normal/imperium/DeltaClass.png'));
    sprites[EnumImages.ShipEmpireArquitens] = Sprite(await Flame.images.load('ships/normal/imperium/Arquitens.png'));
    sprites[EnumImages.ShipEmpireAcclamator] = Sprite(await Flame.images.load('ships/normal/imperium/AcclamatorII.png'));
    sprites[EnumImages.ShipEmpireImperialClass] = Sprite(await Flame.images.load('ships/normal/imperium/ImperialClass.png'));
    sprites[EnumImages.ShipEmpireVictory] = Sprite(await Flame.images.load('ships/normal/imperium/Victory.png'));
    //Ships Republic
    sprites[EnumImages.ShipRepublicACCLAMATOR] = Sprite(await Flame.images.load('ships/normal/republic/Acclamator.png'));
    sprites[EnumImages.ShipRepublicARC170] = Sprite(await Flame.images.load('ships/normal/republic/ARC170.png'));
    sprites[EnumImages.ShipRepublicARQUITENS] = Sprite(await Flame.images.load('ships/normal/republic/Arquitens.png'));
    sprites[EnumImages.ShipRepublicCR90CORVETTE] = Sprite(await Flame.images.load('ships/normal/republic/CR90_1.png'));

    sprites[EnumImages.ShipRepublicETA2ARCTIS] = Sprite(await Flame.images.load('ships/normal/republic/Eta2_1.png'));
    sprites[EnumImages.ShipRepublicNUATTACKSHUTTLE] = Sprite(await Flame.images.load('ships/normal/republic/NU_1.png'));
    sprites[EnumImages.ShipRepublicVENATOR] = Sprite(await Flame.images.load('ships/normal/republic/Venator_1.png'));
    sprites[EnumImages.ShipRepublicYWING] = Sprite(await Flame.images.load('ships/normal/republic/YWing_1.png'));
    sprites[EnumImages.ShipRepublicZ95] = Sprite(await Flame.images.load('ships/normal/republic/Z95.png'));


    //Ships Seperatisten
    sprites[EnumImages.ShipCISValture] = Sprite(await Flame.images.load('ships/normal/seperatisten/Geier.png'));
    sprites[EnumImages.ShipCISC9979] = Sprite(await Flame.images.load('ships/normal/seperatisten/C-9979.png'));
    sprites[EnumImages.ShipCISHyaenen] = Sprite(await Flame.images.load('ships/normal/seperatisten/Hyänen.png'));
    sprites[EnumImages.ShipCISSRPDroid] = Sprite(await Flame.images.load('ships/normal/seperatisten/SRP-Droid.png'));
    sprites[EnumImages.ShipCISZenuas33] = Sprite(await Flame.images.load('ships/normal/seperatisten/Zenuas-33.png'));


    sprites[EnumImages.ShipCISLucrehulk] = Sprite(await Flame.images.load('ships/normal/seperatisten/Lucrehulk.png'));
    sprites[EnumImages.ShipCISMunificent] = Sprite(await Flame.images.load('ships/normal/seperatisten/Munificent.png'));
    sprites[EnumImages.ShipCISProvidenz] = Sprite(await Flame.images.load('ships/normal/seperatisten/Providenz.png'));
    sprites[EnumImages.ShipCISRecusant] = Sprite(await Flame.images.load('ships/normal/seperatisten/Recusant.png'));
    sprites[EnumImages.ShipCISSubjugator] = Sprite(await Flame.images.load('ships/normal/seperatisten/Subjugator.png'));



    //Ships Rebellen
    //Ships Alien (other)
    sprites[EnumImages.AlienShipOne] = Sprite(await Flame.images.load('ships/normal/other/AlienShip1.png'));
    //Laser
    sprites[EnumImages.LaserRed] = Sprite(await Flame.images.load('laser/normal/LaserRed.png'));
    sprites[EnumImages.LaserBlue] = Sprite(await Flame.images.load('laser/normal/LaserBlue.png'));
    sprites[EnumImages.LaserGreen] = Sprite(await Flame.images.load('laser/normal/LaserGreen.png'));
    sprites[EnumImages.LaserViolett] = Sprite(await Flame.images.load('laser/normal/LaserViolett.png'));
    sprites[EnumImages.LaserYellow] = Sprite(await Flame.images.load('laser/normal/LaserYellow.png'));
    //Bullet
    sprites[EnumImages.RocketOne] = Sprite(await Flame.images.load('rockets/RocketOne.png'));
    sprites[EnumImages.RocketTwo] = Sprite(await Flame.images.load('rockets/RocketTwo.png'));
    sprites[EnumImages.RocketThree] = Sprite(await Flame.images.load('rockets/RocketThree.png'));


    print("Ende mit dem Laden der Images");

  }







}