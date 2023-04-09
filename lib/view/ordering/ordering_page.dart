import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';

class OrderPage extends StatefulWidget {
  final String code;

  const OrderPage({super.key, required this.code});

  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends State<OrderPage> {
  late Socket socket;
  final TextEditingController _textEditingController = TextEditingController();
  final List<String> _messages = [];

  @override
  void initState() {
    super.initState();
    socket = io('http://87.107.146.132:5000');
    socket.emit('join', widget.code);
    socket.on('message', (data) {
      setState(() {
        _messages.add(data['message']);
      });
    });
  }

  void sendMessage(String message) {
    socket.emit('message', {'message': message, 'code': widget.code});
  }

  @override
  void dispose() {
    socket.disconnect();
    super.dispose();
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
            child: SingleChildScrollView(
              child: Column(
                children: _messages.map((message) => Text(message)).toList(),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter your message',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    String message = _textEditingController.text;
                    sendMessage(message);
                    _textEditingController.clear();
                  },
                ),
              ),
              onSubmitted: (message) {
                sendMessage(message);
                _textEditingController.clear();
              },
              controller: _textEditingController,
            ),
          ),
        ],
      ),
    );
  }
}
