 
// test/garden/plant/garden_plant_gen.dart 
 
import "package:garden_plant/garden_plant.dart"; 
 
genCode(Repository repository) { 
  repository.gen("garden_plant"); 
} 
 
initData(Repository repository) { 
   var gardenDomain = repository.getDomainModels("Garden"); 
   var plantModel = gardenDomain.getModelEntries("Plant"); 
   plantModel.init(); 
   //plantModel.display(); 
} 
 
void main() { 
  var repository = new Repository(); 
  genCode(repository); 
  //initData(repository); 
} 
 
