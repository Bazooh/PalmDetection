import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:app/grpc_generated/init_py.dart';
import 'package:grpc/grpc_connection_interface.dart';
import 'package:app/grpc_generated/client.dart';

class ConnectionPage extends StatefulWidget {
  final void Function(BuildContext context, ClientChannelBase clientChannel)
      onConnected;

  const ConnectionPage({super.key, required this.onConnected});

  @override
  ConnectionPageState createState() => ConnectionPageState();
}

class ConnectionPageState extends State<ConnectionPage> {
  final TextEditingController _ipController = TextEditingController();
  bool _isLoading = false;
  bool _connectionFailed = false;
  String _error = '';

  void _connect(BuildContext context) {
    setState(() {
      _isLoading = true;
      _connectionFailed = false;
    });

    List<String> ipInfos = _ipController.text.split(':');

    if (ipInfos.length != 2) {
      setState(() {
        _isLoading = false;
        _connectionFailed = true;
        _error = 'Invalid IP address. Please enter in the format "host:port"';
      });
      return;
    }

    Future<void> pyInitResult =
        initPy(host: ipInfos[0], port: int.parse(ipInfos[1]), doNoStartPy: true);

    pyInitResult.then((value) {
      widget.onConnected(context, getClientChannel(host: ipInfos[0], port: int.parse(ipInfos[1])));
    }).catchError((error) {
      setState(() {
        _isLoading = false;
        _connectionFailed = true;
        _error = error.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connect Page'),
      ),
      body: Stack(
        children: [
          background,
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _ipController,
                    decoration: const InputDecoration(labelText: 'Enter IP Address'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _isLoading ? null : () => _connect(context),
                    child: const Text('Connect'),
                  ),
                  const SizedBox(height: 16),
                  if (_isLoading) const CircularProgressIndicator(),
                  if (_connectionFailed)
                    Text(
                      'Connection failed. Please retry.\n$_error',
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
