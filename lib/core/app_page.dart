import 'package:ayov2/data/data.dart';
import 'package:ayov2/model/model.dart';

class AppPage {
  final AppPageData _appPageData = AppPageData();

  Future<HomePageModel> home() async {
    return await _appPageData.home();
  }
}
