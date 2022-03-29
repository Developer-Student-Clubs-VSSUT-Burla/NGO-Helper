import 'package:flutter/material.dart';

import '../models/chat_message.dart';
import '../models/chat_user.dart';

class MessageService {
  User user1 = User(
    name: 'Sample NGO 1',
    image: 'images/emoji1.png',
    color: const Color(0xFFFFE0EC),
  );

  User user2 = User(
    name: 'Sample NGO 2',
    image: 'images/emoji2.png',
    color: const Color(0xFFBFE9F2),
  );

  User user3 = User(
    name: 'Sample NGO 3',
    image: 'images/emoji3.png',
    color: const Color(0xFFFFD6C4),
  );

  User user4 = User(
    name: 'Sample NGO 4',
    image: 'images/emoji4.png',
    color: const Color(0xFFC3C1E6),
  );

  User user5 = User(
    name: 'Sample NGO 5',
    image: 'images/emoji5.png',
    color: const Color(0xFFFFE0EC),
  );

  User user6 = User(
    name: 'Sample NGO 6',
    image: 'images/emoji6.png',
    color: const Color(0xFFFFE5A6),
  );

  User user7 = User(
    name: 'Sample NGO 7',
    image: 'images/emoji7.png',
    color: const Color(0xFFFFE0EC),
  );

  User user8 = User(
    name: 'Sample NGO 8',
    image: 'images/emoji8.png',
    color: const Color(0xFFFFE0EC),
  );

  User user9 = User(
    name: 'Sample NGO 9',
    image: 'images/emoji9.png',
    color: const Color(0xFFC3C1E6),
  );

  User user10 = User(
    name: 'Sample NGO 10',
    image: 'images/emoji10.png',
    color: const Color(0xFFFF95A2),
  );

  // Users
  List<User> getUsers() {
    return [
      user1,
      user2,
      user3,
      user4,
      user5,
      user6,
      user7,
      user8,
      user9,
      user10
    ];
  }

  // Chats
  List<Message> getChats() {
    return [
      Message(
        sender: user6,
        time: '18:32',
        text: 'Collaborate with us for better social impact.',
      ),
      Message(
        sender: user1,
        time: '14:05',
        text: 'Convince your local Rotary for any particular theme.',
      ),
      Message(
        sender: user3,
        time: '14:00',
        text: 'Yeah. Can you connect with us for the upcoming events?',
      ),
      Message(
        sender: user8,
        time: '13:25',
        text:
            'NGO is actually up and running, they will be your "eyes-and-ears" network on the ground!',
      ),
      Message(
        sender: user2,
        time: '13:35',
        text: 'Tell them of your idea, ask their opinion. ',
      ),
      Message(
        sender: user4,
        time: '12:11',
        text:
            'Many NGOs are actually eager to talk to people, to showcase their work.',
      ),
      Message(
        sender: user5,
        time: '16:03',
        text:
            'My organisation is struggling to keep afloat. Is there anyway you can can assist ?',
      ),
      Message(
        sender: user9,
        time: '11:38',
        text:
            'I came up with an idea of opening up an organization with the aim of reducing on the number of street kids',
      ),
    ];
  }

  // Chat messages
  List<Message> getMessages(User sender) {
    return [
      Message(
        sender: null,
        time: '18:42',
        text:
            'Establishing an NGO can be a challenging process, especially at the beginning. You will need resources, knowledge, skills, and support right from the beginning of your journey.',
      ),
      Message(
        sender: sender,
        time: '18:39',
        text:
            'Though it us difficult to attract donor funding, we were fortunate to get funds to built our centre for 120 kids and not only impact all their families but an entire community.',
      ),
      Message(
        sender: sender,
        time: '18:39',
        text:
            'I am passionate about starting a local NGO that will address parenting issues in my community?',
      ),
      Message(
        sender: null,
        time: '18:36',
        text: 'We appreciate for your valuable time to read our articles.',
      ),
      Message(
        sender: sender,
        time: '18:35',
        text:
            'I have been reading your articles and find them educative and timely. ',
      ),
    ];
  }
}
