 
part of garden_plant; 
 
// lib/garden/plant/model.dart 
 
class PlantModel extends PlantEntries { 
 
  PlantModel(Model model) : super(model); 
 
  fromJsonToGardenEntry() { 
    fromJsonToEntry(gardenPlantGardenEntry); 
  } 
 
  fromJsonToPlantCategoryEntry() { 
    fromJsonToEntry(gardenPlantPlantCategoryEntry); 
  } 
 
  fromJsonToModel() { 
    fromJson(gardenPlantModel); 
  } 
 
  init() { 
    initPlantCategories(); 
    initGardens(); 
  } 
 
  initGardens() { 
    var garden1 = new Garden(gardens.concept); 
      garden1.name = 'college'; 
      garden1.description = 'tag'; 
      garden1.geoposition = 'unit'; 
      gardens.add(garden1); 
 
    var garden1plants1 = new Plant(garden1.plants.concept); 
      garden1plants1.name = 'mile'; 
      garden1plants1.description = 'craving'; 
      garden1plants1.picture = 'country'; 
    garden1plants1.garden = garden1; 
    garden1.plants.add(garden1plants1); 
 
    var garden1plants2 = new Plant(garden1.plants.concept); 
      garden1plants2.name = 'horse'; 
      garden1plants2.description = 'ocean'; 
      garden1plants2.picture = 'sailing'; 
    garden1plants2.garden = garden1; 
    garden1.plants.add(garden1plants2); 
 
    var garden2 = new Garden(gardens.concept); 
      garden2.name = 'hat'; 
      garden2.description = 'rice'; 
      garden2.geoposition = 'tape'; 
      gardens.add(garden2); 
 
    var garden2plants1 = new Plant(garden2.plants.concept); 
      garden2plants1.name = 'ball'; 
      garden2plants1.description = 'cabinet'; 
      garden2plants1.picture = 'performance'; 
    garden2plants1.garden = garden2; 
    garden2.plants.add(garden2plants1); 
 
    var garden2plants2 = new Plant(garden2.plants.concept); 
      garden2plants2.name = 'election'; 
      garden2plants2.description = 'pattern'; 
      garden2plants2.picture = 'undo'; 
    garden2plants2.garden = garden2; 
    garden2.plants.add(garden2plants2); 
 
    var garden3 = new Garden(gardens.concept); 
      garden3.name = 'umbrella'; 
      garden3.description = 'parfem'; 
      garden3.geoposition = 'undo'; 
      gardens.add(garden3); 
 
    var garden3plants1 = new Plant(garden3.plants.concept); 
      garden3plants1.name = 'hell'; 
      garden3plants1.description = 'home'; 
      garden3plants1.picture = 'beans'; 
    garden3plants1.garden = garden3; 
    garden3.plants.add(garden3plants1); 
 
    var garden3plants2 = new Plant(garden3.plants.concept); 
      garden3plants2.name = 'sailing'; 
      garden3plants2.description = 'beer'; 
      garden3plants2.picture = 'accident'; 
    garden3plants2.garden = garden3; 
    garden3.plants.add(garden3plants2); 
 
  } 
 
  initPlantCategories() { 
    var plantCategory1 = new PlantCategory(plantCategories.concept); 
      plantCategory1.latinName = 'election'; 
      plantCategory1.description = 'selfdo'; 
      plantCategory1.isEdible = true; 
      plantCategory1.harvestZone = 9483; 
      plantCategories.add(plantCategory1); 
 
    var plantCategory2 = new PlantCategory(plantCategories.concept); 
      plantCategory2.latinName = 'selfie'; 
      plantCategory2.description = 'entertainment'; 
      plantCategory2.isEdible = false; 
      plantCategory2.harvestZone = 1321; 
      plantCategories.add(plantCategory2); 
 
    var plantCategory3 = new PlantCategory(plantCategories.concept); 
      plantCategory3.latinName = 'letter'; 
      plantCategory3.description = 'selfdo'; 
      plantCategory3.isEdible = false; 
      plantCategory3.harvestZone = 9561; 
      plantCategories.add(plantCategory3); 
 
  } 
 
  // added after code gen - begin 
 
  // added after code gen - end 
 
} 
 
