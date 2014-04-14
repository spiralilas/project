//import "package:dartling_default_app/dartling_default_app.dart"; 
import "package:garden_plant/garden_plant.dart"; 
import 'package:polymer/polymer.dart';

/**
 * A Polymer garden-list element.
 */

@CustomTag('garden-list')
class GardenList extends PolymerElement {
  @observable String title = "Garden-list";
  @observable String name;
  @observable String description;
  @observable String geoposition;
  @observable bool selected; 

  
    //List gardens = [new Garden('Bob', 'Smith'), new Person('Alice', 'Johnson')];
      
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
     List displayedGardens = toObservable(gardenEntries.gardens);

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