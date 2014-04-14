part of garden_plant; 
 
// lib/gen/garden/plant/plants.dart 
 
abstract class PlantGen extends ConceptEntity<Plant> { 
 
  PlantGen(Concept concept) : super.of(concept); 
 
  PlantGen.withId(Concept concept, String name) : super.of(concept) { 
    setAttribute("name", name); 
  } 
 
  Reference get gardenReference => getReference("garden"); 
  set gardenReference(Reference reference) => setReference("garden", reference); 
  
  Garden get garden => getParent("garden"); 
  set garden(Garden p) => setParent("garden", p); 
  
  Reference get plantCategoryReference => getReference("plantCategory"); 
  set plantCategoryReference(Reference reference) => setReference("plantCategory", reference); 
  
  PlantCategory get plantCategory => getParent("plantCategory"); 
  set plantCategory(PlantCategory p) => setParent("plantCategory", p); 
  
  String get name => getAttribute("name"); 
  set name(String a) => setAttribute("name", a); 
  
  String get description => getAttribute("description"); 
  set description(String a) => setAttribute("description", a); 
  
  dynamic get picture => getAttribute("picture"); 
  set picture(dynamic a) => setAttribute("picture", a); 
  
  Plant newEntity() => new Plant(concept); 
  Plants newEntities() => new Plants(concept); 
  
  int nameCompareTo(Plant other) { 
    return name.compareTo(other.name); 
  } 
 
} 
 
abstract class PlantsGen extends Entities<Plant> { 
 
  PlantsGen(Concept concept) : super.of(concept); 
 
  Plants newEntities() => new Plants(concept); 
  Plant newEntity() => new Plant(concept); 
  
} 
 
