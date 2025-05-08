import 'package:practising_folder/my_home_page/side_sheets/sheets_model.dart';

class SheetsService {
  List<SheetsModel> getMenus(){
    return [
      SheetsModel(menu: 'Snackbar'),
      SheetsModel(menu: 'Navigation'),
      SheetsModel(menu: 'TextField'),
      SheetsModel(menu: 'SearchBar'),
      SheetsModel(menu: 'Card'),
    ];
  }
}