import 'dart:async';
import 'package:flutter/material.dart';
import 'item_model.dart';

final List<Item> demoItems = [
  Item(
    id: 0,
    title: 'Alpha',
    shape: BoxShape.circle,
    backgroundColor: Colors.redAccent,
  ),
  Item(
    id: 1,
    title: 'Bravo',
    shape: BoxShape.rectangle,
    backgroundColor: Colors.blueAccent,
  ),
  Item(
    id: 2,
    title: 'Charlie',
    shape: BoxShape.circle,
    backgroundColor: Colors.greenAccent,
  ),
  Item(
    id: 3,
    title: 'Delta',
    shape: BoxShape.rectangle,
    backgroundColor: Colors.orangeAccent,
  ),
  Item(
    id: 4,
    title: 'Echo',
    shape: BoxShape.circle,
    backgroundColor: Colors.purpleAccent,
  ),
  Item(
    id: 5,
    title: 'Foxtrot',
    shape: BoxShape.rectangle,
    backgroundColor: Colors.teal,
  ),
  Item(
    id: 6,
    title: 'Golf',
    shape: BoxShape.circle,
    backgroundColor: Colors.pinkAccent,
  ),
  Item(
    id: 7,
    title: 'Hotel',
    shape: BoxShape.rectangle,
    backgroundColor: Colors.amber,
  ),
  Item(
    id: 8,
    title: 'India',
    shape: BoxShape.circle,
    backgroundColor: Colors.indigo,
  ),
  Item(
    id: 9,
    title: 'Juliet',
    shape: BoxShape.rectangle,
    backgroundColor: Colors.cyan,
  ),
];

Stream<Item> timedItems(Duration interval) {
  late final StreamController<Item> controller;
  Timer? timer;
  var index = 0;

  void tick(Timer _) {
    if (index >= demoItems.length) {
      timer?.cancel();
      controller.close();
      return;
    }

    final current = demoItems[index];
    controller.add(current);

    if (current.id == (demoItems.length - 1).toDouble()) {
      timer?.cancel();
      controller.close();
    }

    index++;
  }

  void start() => timer = Timer.periodic(interval, tick);
  void stop() {
    timer?.cancel();
    timer = null;
  }

  controller = StreamController<Item>(
    onListen: start,
    onPause: stop,
    onResume: start,
    onCancel: stop,
  );

  return controller.stream;
}
