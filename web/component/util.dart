library util;

import 'dart:html';
import 'package:garden_plant/garden_plant.dart';

save(Gardens gardens) {
  PlantModel plantModel;
  PlantCategories plantCategories;
  
  var repository = new Repository(); 
  var gardenDomain = repository.getDomainModels("Garden"); 
  plantModel = gardenDomain.getModelEntries("Plant");    
  plantCategories = plantModel.plantCategories;
  gardens = plantModel.gardens;
  
  window.localStorage['garden_plants'] = plantModel.toJson();
  }