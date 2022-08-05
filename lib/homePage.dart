// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:introduction_pages/message.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Message> messages = [
    Message(
        text: 'Hi, ',
        date: DateTime.now().subtract(const Duration(days: 6)),
        isSentByMe: false),
    Message(
        text: 'Hi, can I help You.',
        date: DateTime.now().subtract(const Duration(days: 5)),
        isSentByMe: true),
    Message(
        text: 'Yeah, of course could you please inform me about your services.',
        date: DateTime.now().subtract(const Duration(days: 2)),
        isSentByMe: true),
    Message(
        text: 'That is a very good plan to challenge with you.',
        date: DateTime.now().subtract(const Duration(days: 2)),
        isSentByMe: false),
    Message(
        text: 'I am trying to use backend flutter app',
        date: DateTime.now().subtract(const Duration(days: 1)),
        isSentByMe: false),
    Message(
        text: 'So lets start. and go straight to the projects.',
        date: DateTime.now().subtract(const Duration(days: 1)),
        isSentByMe: true),
  ].reversed.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wellcome'),
      ),
      body: Column(children: [
        Expanded(
            child: GroupedListView<Message, DateTime>(
          reverse: true,
          order: GroupedListOrder.DESC,
          useStickyGroupSeparators: true,
          floatingHeader: true,
          elements: messages,
          padding: const EdgeInsets.all(8),
          groupBy: (message) =>
              DateTime(message.date.year, message.date.month, message.date.day),
          groupHeaderBuilder: (Message message) => const SizedBox(
            height: 40,
            child: Center(
              child: Card(
                color: Colors.blue,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'for test',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          itemBuilder: (context, Message message) => BubbleSpecialThree(
            text: message.text,
            tail: true,
            seen: message.isSentByMe,
            isSender: message.isSentByMe,
            color: message.isSentByMe
                ? Colors.blue
                : const Color.fromARGB(255, 236, 234, 234),
          ),
        )),
        Container(
          color: Colors.grey[300],
          child: MessageBar(
            onSend: (text) {
              final message =
                  Message(text: text, date: DateTime.now(), isSentByMe: true);
              setState(() {
                messages.add(message);
              });
            },
          ),
        )
      ]),
    );
  }
}
