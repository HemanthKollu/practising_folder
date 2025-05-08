import 'package:practising_folder/my_home_page/searchBar/search_bar_model.dart';

class SearchBarService {
  List<SearchBarModel> getSearchItems(){
    return[
      SearchBarModel(name: 'apple'),
      SearchBarModel(name: 'banana'),
      SearchBarModel(name: 'mango'),
      SearchBarModel(name: 'custardApple'),
      SearchBarModel(name: 'orange'),
      SearchBarModel(name: 'pineapple'),
      SearchBarModel(name: 'grapes'),
    ];
  }
}