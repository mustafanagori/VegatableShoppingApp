import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt count = 1.obs;

  void inc(Value) {
    count += Value;
    print(count);
  }

  void dec(Value) {
    if (count.value > 1) {
      count--;
      print(count);
    }
  }

  void reset() {
    count.value = 1;
  }
}
