


enum EnumMusic


{
  StarWarsTheCloneWarsIntro(musicfilepath: 'music/FertigCloneWarsBegin.ogg'),
  StarWarsTheCloneWarsTheme(musicfilepath: "music/StarWarsTheClonesTheme.ogg"),

  //Laser
  LaserOne(musicfilepath: "sounds/Laser.ogg"),


  ;
  const EnumMusic({
    required this.musicfilepath,
  });

  final String musicfilepath;


}