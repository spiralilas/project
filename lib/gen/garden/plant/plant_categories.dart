part of garden_plant; 
 
// lib/gen/garden/plant/plant_categories.dart 
 
abstract class PlantCategoryGen extends ConceptEntity<PlantCategory> { 
 
  PlantCategoryGen(Concept concept) : super.of(concept) { 
    Concept plantConcept = concept.model.concepts.singleWhereCode("Plant"); 
    setChild("plants", new Plants(plantConcept)); 
  } 
 
  PlantCategoryGen.withId(Concept concept, String latinName) : super.of(concept) { 
    setAttribute("latinName", latinName); 
    Concept plantConcept = concept.model.concepts.singleWhereCode("Plant"); 
    setChild("plants", new Plants(plantConcept)); 
  } 
 
  String get latinName => getAttribute("latinName"); 
  set latinName(String a) => setAttribute("latinName", a); 
  
  String get description => getAttribute("description"); 
  set description(String a) => setAttribute("description", a); 
  
  bool get isEdible => getAttribute("isEdible"); 
  set isEdible(bool a) => setAttribute("isEdible", a); 
  
  int get harvestZone => getAttribute("harvestZone"); 
  set harvestZone(int a) => setAttribute("harvestZone", a); 
  
  Plants get plants => getChild("plants"); 
  
  PlantCategory newEntity() => new PlantCategory(concept); 
  PlantCategories newEntities() => new PlantCategories(concept); 
  
  int latinNameCompareTo(PlantCategory other) { 
    return latinName.compareTo(other.latinName); 
  } 
 
} 
 
abstract class PlantCategoriesGen extends Entities<PlantCategory> { 
 
  PlantCategoriesGen(Concept concept) : super.of(concept); 
 
  PlantCategories newEntities() => new PlantCategories(concept); 
  PlantCategory newEntity() => new PlantCategory(concept); 
  
} 
 
