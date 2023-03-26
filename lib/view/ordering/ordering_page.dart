import 'dart:async';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';

class OrderPage extends StatefulWidget {
  final String code;
  const OrderPage({super.key, required this.code});

  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends State<OrderPage> {
  late WebSocketChannel channel;
  late StreamController _streamController;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _streamController = StreamController();
    connect();
  }

  @override
  void dispose() {
    channel.sink.close();
    _streamController.close();
    super.dispose();
  }

  void connect() {
    String url = 'ws://localhost:3000/resturants/${widget.code}';
    channel = WebSocketChannel.connect(Uri.parse(url));
    channel.stream.listen((event) {
      _streamController.add(event);
    }, onError: (error) {}, onDone: () {});
  }

  void sendOrder(String order) {
    channel.sink.add('{"order": "$order"}');
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('رستوران ${widget.code}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: _streamController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data as String;
                  final decoded = json.decode(data);
                  return Text(
                    (decoded['order']),
                    style: const TextStyle(
                        fontSize: 48,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
          TextField(
            controller: _controller,
            onSubmitted: (value) {
              sendOrder(value);
            },
            decoration: InputDecoration(
              hintText: 'Enter message',
              suffixIcon: IconButton(
                onPressed: () {
                  sendOrder(_controller.text);
                },
                icon: const Icon(
                  Icons.send,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
