//import "package:dartling_default_app/dartling_default_app.dart"; 
import "package:garden_plant/garden_plant.dart"; 
import 'package:polymer/polymer.dart';

/**
 * A Polymer garden-list element.
 */


class DisplayedGarden {
  String code;
  String name;
  String description;
  List<DisplayedPlant> displayedPlants;
  String  geoposition; //will need to change type

  DisplayedGarden(this.name, this.description, this.displayedPlants, this.geoposition);
} 

class DisplayedPlant {
  String code;
  String name;
  String description;

  DisplayedPlant(this.code, this.name, this.description);
} 

/**Starting to  try with angular (with polymer binding) instead
 
@NgController(
    selector: '[ctrlgarden-list]',
    publishAs: 'ctrl')
class GardenListController {

  List<DisplayedGarden> displayedGardens;
  GardenListController() {
    displayedGardens = observableGardens(var gardenEntries);
  }
 
  **/

@CustomTag('garden-list')
class GardenList extends PolymerElement {
  @observable String title = "Garden-list";
  //@observable String name;
  //@observable String description;
  //@observable String geoposition;
  @observable bool selected; 
  //@observable List displayedGardens;

  GardenList.created() : super.created();
  
  
  @override
  void enteredView(){
    super.enteredView();
    var repo = new Repository();
    initGardenData(repo);
  }
  
  void initGardenData(Repository repo){
     var gardenModels = repo.getDomainModels('Garden');
     var gardenEntries = gardenModels.getModelEntries('Plant');
     initGarden(gardenEntries);
     initPlantCategory(gardenEntries);
     initGardenPlants(gardenEntries);
     gardenEntries.display();
     gardenEntries.displayJson();
     
     var gardens = gardenEntries.gardens;
     List displayedGardens = toObservable(gardens); //NOT WORKING
     
     //List displayedGardens = observableGardens(gardenEntries);//not working either. Pourquoi il s'en va déjà dans polymer, avant que ce soit observable ?
     //displayedGardens = toObservable(displayedGardens);
        }
  

  List <DisplayedGarden> observableGardens(var gardenEntries) {
    List <DisplayedGarden> someGardens;
    var gardens = gardenEntries.gardens;
    for (var garden in gardens){
      DisplayedGarden aGarden = new DisplayedGarden (garden.code, garden.name, garden.description, garden.geolocation);
      someGardens.add(aGarden);
    }
    return someGardens;
  }

  
    void initGarden(var entries){
    var gardens = entries.gardens;
    var garden = new Garden(gardens.concept);

    garden.code = "1";
    garden.name = "jardin1";
    garden.description = "desc  jardin1";
    garden.geoposition = "geoposition";
    gardens.add(garden); 
  }  

  void initPlantCategory(entries){
    var gardens = entries.gardens;
    var plantCategories = entries.plantCategories;
    var plantCategory = new PlantCategory(plantCategories.concept);
 
    plantCategory.code = "1";
    plantCategory.latinName = "latinName";
    plantCategory.description = "plant description";
    plantCategory.isEdible = true;
    plantCategory.harvestZone = 5;
    plantCategories.add(plantCategory);
  }

  initGardenPlants(var entries){
  
  }
    

  
}