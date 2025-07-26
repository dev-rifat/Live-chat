import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';

class MessageController extends GetxController {
  var messages = <String>[].obs;
  final message = TextEditingController();
  final isTyping = false.obs;

  late IOWebSocketChannel channel;

  void websocket() {
    channel = IOWebSocketChannel.connect('wss://ws.ifelse.io');

    channel.stream.listen((event) {
      print("🟢 Raw: $event");
      try {
        final decoded = jsonDecode(event);
        print("✅ Parsed: $decoded");
        if (decoded is Map && decoded.containsKey('message')) {
          messages.add(decoded['message']);
        } else {
          messages.add(event);
        }
      } catch (e) {
        print("❌ Not JSON: $e");
        messages.add(event);
      }
    });
  }

  void sendMessage() {
    if (message.text.trim().isEmpty) return;
    final msg = message.text.trim();
    channel.sink.add(msg);
    messages.add("You: $msg");
    message.clear();
    isTyping.value = false;
  }

  @override
  void onClose() {
    channel.sink.close();
    message.dispose();
    super.onClose();
  }
}
