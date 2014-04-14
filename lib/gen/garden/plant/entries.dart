part of garden_plant; 
 
// lib/gen/garden/plant/entries.dart 
 
class PlantEntries extends ModelEntries { 
 
  PlantEntries(Model model) : super(model); 
 
  Map<String, Entities> newEntries() { 
    var entries = new Map<String, Entities>(); 
    var concept; 
    concept = model.concepts.singleWhereCode("Garden"); 
    entries["Garden"] = new Gardens(concept); 
    concept = model.concepts.singleWhereCode("PlantCategory"); 
    entries["PlantCategory"] = new PlantCategories(concept); 
    return entries; 
  } 
 
  Entities newEntities(String conceptCode) { 
    var concept = model.concepts.singleWhereCode(conceptCode); 
    if (concept == null) { 
      throw new ConceptError("${conceptCode} concept does not exist.") ; 
    } 
    if (concept.code == "Garden") { 
      return new Gardens(concept); 
    } 
    if (concept.code == "Plant") { 
      return new Plants(concept); 
    } 
    if (concept.code == "PlantCategory") { 
      return new PlantCategories(concept); 
    } 
    return null; 
  } 
 
  ConceptEntity newEntity(String conceptCode) { 
    var concept = model.concepts.singleWhereCode(conceptCode); 
    if (concept == null) { 
      throw new ConceptError("${conceptCode} concept does not exist.") ; 
    } 
    if (concept.code == "Garden") { 
      return new Garden(concept); 
    } 
    if (concept.code == "Plant") { 
      return new Plant(concept); 
    } 
    if (concept.code == "PlantCategory") { 
      return new PlantCategory(concept); 
    } 
    return null; 
  } 
 
  Gardens get gardens => getEntry("Garden"); 
  PlantCategories get plantCategories => getEntry("PlantCategory"); 
 
} 
 
