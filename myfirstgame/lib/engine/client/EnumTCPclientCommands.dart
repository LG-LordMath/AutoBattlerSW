

enum EnumTCPclientCommands {


  CONNECTION(command: ""),

  ;

  const EnumTCPclientCommands({
    required this.command,
  });

  final String command;

  String get getCommand => command;


}