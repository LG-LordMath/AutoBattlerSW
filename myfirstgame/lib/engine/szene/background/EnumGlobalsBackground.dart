


enum EnumGlobalsBackground {

  backgroundOne(path: "background/space1.png"),
  backgroundTwo(path: "background/space2.png"),
  backgroundThree (path: "background/space3.png"),
  backgroundFour (path:  "background/space4.png"),
  backgroundFive  (path: "background/space5.png");

  const EnumGlobalsBackground({
    required this.path,
  });

  final String path;


}