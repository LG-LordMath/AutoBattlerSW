

enum EnumGoodAginst {

  no(multi: 0),
  shield (multi: 2),
  hp (multi: 2),
  both  (multi: 3);

  const EnumGoodAginst({
    required this.multi,
  });

  final int multi;

  int get damagemulti => multi;

}