 
// web/garden/plant/garden_plant_web.dart 
 
import "dart:html"; 
 
import "package:dartling_default_app/dartling_default_app.dart"; 
import "package:garden_plant/garden_plant.dart"; 
 
initData(Repository repository) { 
   var gardenDomain = repository.getDomainModels("Garden"); 
   var plantModel = gardenDomain.getModelEntries("Plant"); 
   plantModel.init(); 
   //plantModel.display(); 
} 
 
showData(Repository repository) { 
   var mainView = new View(document, "main"); 
   mainView.repo = repository; 
   new RepoMainSection(mainView); 
} 
 
void main() { 
  var repository = new Repository(); 
  initData(repository); 
  showData(repository); 
} 
 
