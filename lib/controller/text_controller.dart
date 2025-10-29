import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TextController extends GetxController {
  final storage = GetStorage();
  var userName = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadUserName();
  }

  void loadUserName() async {
    await GetStorage.init();
    userName.value = storage.read('userName') ?? '';
  }

  void saveUserName(String name) {
    userName.value = name;
    storage.write('userName', name);
  }
}

class IconController extends GetxController {

  var items = <RxBool>[].obs;

  var singleItem = false.obs;

  void oneItem(){
    singleItem.value = !singleItem.value;
  }

  void addInitialItems(int count){
    for(int i = 0; i<count; i ++){
      items.add(false.obs);
    }
  }

  void addItem(){
    items.add(false.obs);
  }

  void toggleItem(int index) {
    items[index].value = !items[index].value;
  }
}

class IncrementController extends GetxController{
  var count = 1.obs;
  void increment(){
    count ++;
  }
  void decrement (){
    if(count>1){
      count--;
      return;
    }
  }
}
