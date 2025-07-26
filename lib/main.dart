import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_pages.dart';



void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale("en", "US"),
      fallbackLocale: const Locale("en", "US"),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}



//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'WebSocket App',
//       debugShowCheckedModeBanner: false,
//       home: WebSocketDemo(),
//     );
//   }
// }
//
// class WebSocketDemo extends StatefulWidget {
//   @override
//   _WebSocketDemoState createState() => _WebSocketDemoState();
// }
//
// class _WebSocketDemoState extends State<WebSocketDemo> {
//   late WebSocketChannel channel;
//
//   @override
//   void initState() {
//     super.initState();
//     channel = WebSocketChannel.connect(
//       Uri.parse('wss://ws.ifelse.io'), // ✅ Working echo WebSocket
//     );
//
//     print(channel.stream);
//   }
//
//   @override
//   void dispose() {
//     channel.sink.close();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('WebSocket Home')),
//       body: StreamBuilder(
//         stream: channel.stream,
//         builder: (context, snapshot) {
//           return GestureDetector(
//             onTap: () => Get.to(() => InboxScreen()),
//             child: Center(
//               child: Text(
//                 snapshot.hasData ? '${snapshot.data}' : 'Tap to open Inbox',
//                 style: TextStyle(fontSize: 18),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class InboxScreen extends StatefulWidget {
//   @override
//   _InboxScreenState createState() => _InboxScreenState();
// }
//
// class _InboxScreenState extends State<InboxScreen> {
//   final TextEditingController _controller = TextEditingController();
//   late WebSocketChannel channel;
//
//   @override
//   void initState() {
//     super.initState();
//     channel = WebSocketChannel.connect(
//       Uri.parse('wss://ws.ifelse.io'),
//     );
//   }
//
//   @override
//   void dispose() {
//     channel.sink.close();
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _sendMessage() {
//     if (_controller.text.isNotEmpty) {
//       channel.sink.add(_controller.text);
//       _controller.clear();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Inbox')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: _controller,
//               decoration: InputDecoration(
//                 labelText: 'Send a message',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: StreamBuilder(
//                 stream: channel.stream,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasError) {
//                     return Center(child: Text('Error: ${snapshot.error}'));
//                   } else if (!snapshot.hasData) {
//                     return Center(child: Text('Waiting for messages...'));
//                   } else {
//                     return Center(
//                       child: Text(
//                         '${snapshot.data}',
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     );
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _sendMessage,
//         tooltip: 'Send Message',
//         child: Icon(Icons.send),
//       ),
//     );
//   }
// }
