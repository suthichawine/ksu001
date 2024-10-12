

import 'package:get/get.dart';
import 'package:ksu001/models/faculty_model.dart';
import 'package:ksu001/services/faculty_service.dart';

class FacultyController extends GetxController {
  var faculties = <Faculty>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchFaculties();
  }

  Future<void> fetchFaculties() async {
    try {
      isLoading(true);
      var fetchedFaculties = await FacultyService().getAllFaculties();
      faculties.assignAll(fetchedFaculties);
    } finally {
      isLoading(false);
    }
  }
}
