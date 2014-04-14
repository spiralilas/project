part of garden_plant; 
 
// lib/gen/garden/plant/gardens.dart 
 
abstract class GardenGen extends ConceptEntity<Garden> { 
 
  GardenGen(Concept concept) : super.of(concept) { 
    Concept plantConcept = concept.model.concepts.singleWhereCode("Plant"); 
    setChild("plants", new Plants(plantConcept)); 
  } 
 
  GardenGen.withId(Concept concept, String name) : super.of(concept) { 
    setAttribute("name", name); 
    Concept plantConcept = concept.model.concepts.singleWhereCode("Plant"); 
    setChild("plants", new Plants(plantConcept)); 
  } 
 
  String get name => getAttribute("name"); 
  set name(String a) => setAttribute("name", a); 
  
  String get description => getAttribute("description"); 
  set description(String a) => setAttribute("description", a); 
  
  dynamic get geoposition => getAttribute("geoposition"); 
  set geoposition(dynamic a) => setAttribute("geoposition", a); 
  
  Plants get plants => getChild("plants"); 
  
  Garden newEntity() => new Garden(concept); 
  Gardens newEntities() => new Gardens(concept); 
  
  int nameCompareTo(Garden other) { 
    return name.compareTo(other.name); 
  } 
 
} 
 
abstract class GardensGen extends Entities<Garden> { 
 
  GardensGen(Concept concept) : super.of(concept); 
 
  Gardens newEntities() => new Gardens(concept); 
  Garden newEntity() => new Garden(concept); 
  
} 
 
