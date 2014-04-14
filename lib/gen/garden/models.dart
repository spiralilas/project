part of garden_plant; 
 
// lib/gen/garden/models.dart 
 
class GardenModels extends DomainModels { 
 
  GardenModels(Domain domain) : super(domain) { 
    // fromJsonToModel function from dartling/lib/domain/model/transfer.json.dart 
 
    Model model = fromJsonToModel(gardenPlantModelJson, domain, "Plant"); 
    PlantModel plantModel = new PlantModel(model); 
    add(plantModel); 
 
  } 
 
} 
 
