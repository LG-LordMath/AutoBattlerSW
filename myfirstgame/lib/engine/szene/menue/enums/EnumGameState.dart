enum EnumGameState
{

 BEGINPHASE(timeforphase: 1),
 BUYPHASE(timeforphase: 15), FIGHTPHASE(timeforphase: 45),
 ENDPHASE(timeforphase: 3), ENDGAME(timeforphase: 0)

 ;


  const EnumGameState({
    required this.timeforphase,

  });

  final int timeforphase;

}