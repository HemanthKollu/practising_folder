import 'package:practising_folder/my_home_page/textField_dropdown/textField_dp_model.dart';

class TimeUnitService {
  List<TimeUnitModel> getTimeUnits() {
    return [TimeUnitModel(label: 'Years'), TimeUnitModel(label: 'Months'), TimeUnitModel(label: 'Days'), TimeUnitModel(label: 'Minutes')];
  }
}
