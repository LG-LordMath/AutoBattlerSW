

import 'dart:io';

class TCPclient
{
  bool isconnected = false;
  late String ipv4;
  late int port;
  late Socket socket;

  TCPclient(this.ipv4, this.port);




  connectToServer()
  async {
    try{
      socket = await Socket.connect(ipv4, port);
      print('connected to Server');
      isconnected = true;
      listenToServer();
      sendMessageToServer();
    }
    catch(e)
    {
      print(e);
    }


  }


  listenToServer()
  {
    socket.listen((List<int> data) {
      String message = String.fromCharCodes(data).trim();
      print('Received from server: $message');
    }, onError: (error) {
      print('Error: $error');
    }, onDone: () {
      print('Server disconnected');
    });
  }


  sendMessageToServer()
  {
    socket.write('Hello from Dart Flutter!');
  }




}