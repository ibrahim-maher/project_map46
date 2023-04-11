
import 'package:get/get.dart';
import 'package:project_map/helpers/API_helper.dart';

class DetailsController extends GetxController {
  var id = Get.arguments;
   var doctor =[] ;

  API_helper api_helper = API_helper();

  @override
  void onInit() {
    api_helper.getDoctor(id).then((value) {
      doctor = value;
      print(doctor);

      update();
    });
    super.onInit();
  }


}