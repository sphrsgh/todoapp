import 'dart:async';

void main() async {
  // even only
  // final Stream<int> stream = NumberCreator().stream.where(
  //       (event) => event % 2 == 0,
  //     );

  // skip first 3
  final Stream<int> stream = NumberCreator().stream.skip(3);

  // first way
  // stream.listen((event) {
  //   print(event);
  // });

  // second way
  // await for (final event in stream) {
  //   print(event);
  // }

  // final subscription =
  stream.listen(
    (event) {
      print(event);
    },
  );
  // subscription.cancel();
}

// first way
// Stream<int> numberCreator() async* {
//   int value = 0;
//   while (true) {
//     yield value;
//     value++;
//     await Future.delayed(const Duration(seconds: 1));
//   }
// }

// second way (better) (StreamController)
class NumberCreator {
  final StreamController<int> streamController = StreamController();
  int value = 0;

  NumberCreator() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (value < 15) {
          streamController.add(value++);
        } else {
          streamController.close();
        }
      },
    );
  }

  Stream<int> get stream => streamController.stream;
}
