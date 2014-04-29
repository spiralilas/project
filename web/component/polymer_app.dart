import 'dart:html';
import 'package:garden_plant/garden_plant.dart';
import 'package:polymer/polymer.dart';


@CustomTag('polymer-app')
class PolymerApp extends PolymerElement {
  PlantModel plantModel;
  @observable PlantCategories plantCategories;
  @observable Gardens gardens;
  bool save = false;

  PolymerApp.created() : super.created() {
    var repository = new Repository(); 
    var gardenDomain = repository.getDomainModels("Garden"); 
    plantModel = gardenDomain.getModelEntries("Plant");    
    plantCategories = plantModel.plantCategories;
    gardens = plantModel.gardens; 
    
    //var subscription = save.onChange.listen(
    //      (event) => print('click!'));
    
    // load data
    String json = window.localStorage['garden_plants'];
    if (json == null) {
      plantModel.init();
    } else {
      plantModel.fromJson(json);
    }
    // comment the following line to see that a new category does not appear in its table
    plantCategories.internalList = toObservable(plantCategories.internalList);
    gardens.internalList = toObservable(gardens.internalList);
  }
  
 //not working
  void saveFromComponent() {
    print('The child spoke, I hear');
    if (save == 'true'){
      window.localStorage['garden_plants'] = plantModel.toJson();
    }
    save = false;
  }
  
  saveFromClick(Event e, var detail, Node target) {
    window.localStorage['garden_plants'] = plantModel.toJson();
  }
  
}