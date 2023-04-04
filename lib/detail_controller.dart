import 'package:get/get.dart';

class DetailController extends GetxController{
  var fav =0.obs;

  void favCounter(){
    if(fav.value==1){
      Get.snackbar("Loved It", "You loved It");
    }else{
      fav.value++;
    Get.snackbar("Loved It", "You just  loved It");

    }
  }

}