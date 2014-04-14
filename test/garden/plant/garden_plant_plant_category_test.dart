 
// test/garden/plant/garden_plant_plant_category_test.dart 
 
import "package:unittest/unittest.dart"; 
import "package:dartling/dartling.dart"; 
import "package:garden_plant/garden_plant.dart"; 
 
testGardenPlantPlantCategories( 
    GardenDomain gardenDomain, PlantModel plantModel, PlantCategories plantCategories) { 
  DomainSession session; 
  group("Testing Garden.Plant.PlantCategory", () { 
    session = gardenDomain.newSession();  
    expect(plantModel.isEmpty, isTrue); 
    setUp(() { 
      plantModel.init(); 
    }); 
    tearDown(() { 
      plantModel.clear(); 
    }); 
 
    test("Not empty model", () { 
      expect(plantModel.isEmpty, isFalse); 
      expect(plantCategories.isEmpty, isFalse); 
    }); 
 
    test("Empty model", () { 
      plantModel.clear(); 
      expect(plantModel.isEmpty, isTrue); 
      expect(plantCategories.isEmpty, isTrue); 
      expect(plantCategories.errors.isEmpty, isTrue); 
    }); 
 
    test("From model to JSON", () { 
      var json = plantModel.toJson(); 
      expect(json, isNotNull); 
 
      print(json); 
      //plantModel.displayJson(); 
      //plantModel.display(); 
    }); 
 
    test("From JSON to model", () { 
      var json = plantModel.toJson(); 
      plantModel.clear(); 
      expect(plantModel.isEmpty, isTrue); 
      plantModel.fromJson(json); 
      expect(plantModel.isEmpty, isFalse); 
 
      plantModel.display(); 
    }); 
 
    test("From model entry to JSON", () { 
      var json = plantModel.fromEntryToJson("PlantCategory"); 
      expect(json, isNotNull); 
 
      print(json); 
      //plantModel.displayEntryJson("PlantCategory"); 
      //plantModel.displayJson(); 
      //plantModel.display(); 
    }); 
 
    test("From JSON to model entry", () { 
      var json = plantModel.fromEntryToJson("PlantCategory"); 
      plantCategories.clear(); 
      expect(plantCategories.isEmpty, isTrue); 
      plantModel.fromJsonToEntry(json); 
      expect(plantCategories.isEmpty, isFalse); 
 
      plantCategories.display(title: "From JSON to model entry"); 
    }); 
 
    test("Add plantCategory required error", () { 
      // no required attribute that is not id 
    }); 
 
    test("Add plantCategory unique error", () { 
      var plantCategoryConcept = plantCategories.concept; 
      var plantCategoryCount = plantCategories.length; 
      var plantCategory = new PlantCategory(plantCategoryConcept); 
      var randomPlantCategory = plantCategories.random(); 
      plantCategory.latinName = randomPlantCategory.latinName; 
      var added = plantCategories.add(plantCategory); 
      expect(added, isFalse); 
      expect(plantCategories.length, equals(plantCategoryCount)); 
      expect(plantCategories.errors.length, greaterThan(0)); 
 
      plantCategories.errors.display(title: "Add plantCategory unique error"); 
    }); 
 
    test("Not found plantCategory by new oid", () { 
      var dartlingOid = new Oid.ts(1345648254063); 
      var plantCategory = plantCategories.singleWhereOid(dartlingOid); 
      expect(plantCategory, isNull); 
    }); 
 
    test("Find plantCategory by oid", () { 
      var randomPlantCategory = plantCategories.random(); 
      var plantCategory = plantCategories.singleWhereOid(randomPlantCategory.oid); 
      expect(plantCategory, isNotNull); 
      expect(plantCategory, equals(randomPlantCategory)); 
    }); 
 
    test("Find plantCategory by attribute id", () { 
      var randomPlantCategory = plantCategories.random(); 
      var plantCategory = 
          plantCategories.singleWhereAttributeId("latinName", randomPlantCategory.latinName); 
      expect(plantCategory, isNotNull); 
      expect(plantCategory.latinName, equals(randomPlantCategory.latinName)); 
    }); 
 
    test("Find plantCategory by required attribute", () { 
      // no required attribute that is not id 
    }); 
 
    test("Find plantCategory by attribute", () { 
      var randomPlantCategory = plantCategories.random(); 
      var plantCategory = 
          plantCategories.firstWhereAttribute("description", randomPlantCategory.description); 
      expect(plantCategory, isNotNull); 
      expect(plantCategory.description, equals(randomPlantCategory.description)); 
    }); 
 
    test("Select plantCategories by attribute", () { 
      var randomPlantCategory = plantCategories.random(); 
      var selectedPlantCategories = 
          plantCategories.selectWhereAttribute("description", randomPlantCategory.description); 
      expect(selectedPlantCategories.isEmpty, isFalse); 
      selectedPlantCategories.forEach((se) => 
          expect(se.description, equals(randomPlantCategory.description))); 
 
      //selectedPlantCategories.display(title: "Select plantCategories by description"); 
    }); 
 
    test("Select plantCategories by required attribute", () { 
      // no required attribute that is not id 
    }); 
 
    test("Select plantCategories by attribute, then add", () { 
      var randomPlantCategory = plantCategories.random(); 
      var selectedPlantCategories = 
          plantCategories.selectWhereAttribute("description", randomPlantCategory.description); 
      expect(selectedPlantCategories.isEmpty, isFalse); 
      expect(selectedPlantCategories.source.isEmpty, isFalse); 
      var plantCategoriesCount = plantCategories.length; 
 
      var plantCategory = new PlantCategory(plantCategories.concept); 
      plantCategory.latinName = 'enquiry'; 
      plantCategory.description = 'universe'; 
      plantCategory.isEdible = true; 
      plantCategory.harvestZone = 3351; 
      var added = selectedPlantCategories.add(plantCategory); 
      expect(added, isTrue); 
      expect(plantCategories.length, equals(++plantCategoriesCount)); 
 
      //selectedPlantCategories.display(title: 
      //  "Select plantCategories by attribute, then add"); 
      //plantCategories.display(title: "All plantCategories"); 
    }); 
 
    test("Select plantCategories by attribute, then remove", () { 
      var randomPlantCategory = plantCategories.random(); 
      var selectedPlantCategories = 
          plantCategories.selectWhereAttribute("description", randomPlantCategory.description); 
      expect(selectedPlantCategories.isEmpty, isFalse); 
      expect(selectedPlantCategories.source.isEmpty, isFalse); 
      var plantCategoriesCount = plantCategories.length; 
 
      var removed = selectedPlantCategories.remove(randomPlantCategory); 
      expect(removed, isTrue); 
      expect(plantCategories.length, equals(--plantCategoriesCount)); 
 
      randomPlantCategory.display(prefix: "removed"); 
      //selectedPlantCategories.display(title: 
      //  "Select plantCategories by attribute, then remove"); 
      //plantCategories.display(title: "All plantCategories"); 
    }); 
 
    test("Sort plantCategories", () { 
      plantCategories.sort(); 
 
      //plantCategories.display(title: "Sort plantCategories"); 
    }); 
 
    test("Order plantCategories", () { 
      var orderedPlantCategories = plantCategories.order(); 
      expect(orderedPlantCategories.isEmpty, isFalse); 
      expect(orderedPlantCategories.length, equals(plantCategories.length)); 
      expect(orderedPlantCategories.source.isEmpty, isFalse); 
      expect(orderedPlantCategories.source.length, equals(plantCategories.length)); 
      expect(orderedPlantCategories, isNot(same(plantCategories))); 
 
      //orderedPlantCategories.display(title: "Order plantCategories"); 
    }); 
 
    test("Copy plantCategories", () { 
      var copiedPlantCategories = plantCategories.copy(); 
      expect(copiedPlantCategories.isEmpty, isFalse); 
      expect(copiedPlantCategories.length, equals(plantCategories.length)); 
      expect(copiedPlantCategories, isNot(same(plantCategories))); 
      copiedPlantCategories.forEach((e) => 
        expect(e, equals(plantCategories.singleWhereOid(e.oid)))); 
      copiedPlantCategories.forEach((e) => 
        expect(e, isNot(same(plantCategories.singleWhereId(e.id))))); 
 
      //copiedPlantCategories.display(title: "Copy plantCategories"); 
    }); 
 
    test("True for every plantCategory", () { 
      // no required attribute that is not id 
    }); 
 
    test("Random plantCategory", () { 
      var plantCategory1 = plantCategories.random(); 
      expect(plantCategory1, isNotNull); 
      var plantCategory2 = plantCategories.random(); 
      expect(plantCategory2, isNotNull); 
 
      //plantCategory1.display(prefix: "random1"); 
      //plantCategory2.display(prefix: "random2"); 
    }); 
 
    test("Update plantCategory id with try", () { 
      var randomPlantCategory = plantCategories.random(); 
      var beforeUpdate = randomPlantCategory.latinName; 
      try { 
        randomPlantCategory.latinName = 'picture'; 
      } on UpdateError catch (e) { 
        expect(randomPlantCategory.latinName, equals(beforeUpdate)); 
      } 
    }); 
 
    test("Update plantCategory id without try", () { 
      var randomPlantCategory = plantCategories.random(); 
      var beforeUpdateValue = randomPlantCategory.latinName; 
      expect(() => randomPlantCategory.latinName = 'tag', throws); 
      expect(randomPlantCategory.latinName, equals(beforeUpdateValue)); 
    }); 
 
    test("Update plantCategory id with success", () { 
      var randomPlantCategory = plantCategories.random(); 
      var afterUpdateEntity = randomPlantCategory.copy(); 
      var attribute = randomPlantCategory.concept.attributes.singleWhereCode("latinName"); 
      expect(attribute.update, isFalse); 
      attribute.update = true; 
      afterUpdateEntity.latinName = 'sin'; 
      expect(afterUpdateEntity.latinName, equals('sin')); 
      attribute.update = false; 
      var updated = plantCategories.update(randomPlantCategory, afterUpdateEntity); 
      expect(updated, isTrue); 
 
      var entity = plantCategories.singleWhereAttributeId("latinName", 'sin'); 
      expect(entity, isNotNull); 
      expect(entity.latinName, equals('sin')); 
 
      //plantCategories.display("After update plantCategory id"); 
    }); 
 
    test("Update plantCategory non id attribute with failure", () { 
      var randomPlantCategory = plantCategories.random(); 
      var beforeUpdateValue = randomPlantCategory.description; 
      var afterUpdateEntity = randomPlantCategory.copy(); 
      afterUpdateEntity.description = 'meter'; 
      expect(afterUpdateEntity.description, equals('meter')); 
      // plantCategories.update can only be used if oid, code or id is set. 
      expect(() => plantCategories.update(randomPlantCategory, afterUpdateEntity), throws); 
    }); 
 
    test("Copy Equality", () { 
      var randomPlantCategory = plantCategories.random(); 
      randomPlantCategory.display(prefix:"before copy: "); 
      var randomPlantCategoryCopy = randomPlantCategory.copy(); 
      randomPlantCategoryCopy.display(prefix:"after copy: "); 
      expect(randomPlantCategory, equals(randomPlantCategoryCopy)); 
      expect(randomPlantCategory.oid, equals(randomPlantCategoryCopy.oid)); 
      expect(randomPlantCategory.code, equals(randomPlantCategoryCopy.code)); 
      expect(randomPlantCategory.latinName, equals(randomPlantCategoryCopy.latinName)); 
      expect(randomPlantCategory.description, equals(randomPlantCategoryCopy.description)); 
      expect(randomPlantCategory.isEdible, equals(randomPlantCategoryCopy.isEdible)); 
      expect(randomPlantCategory.harvestZone, equals(randomPlantCategoryCopy.harvestZone)); 
 
      expect(randomPlantCategory.id, isNotNull); 
      expect(randomPlantCategoryCopy.id, isNotNull); 
      expect(randomPlantCategory.id, equals(randomPlantCategoryCopy.id)); 
 
      var idsEqual = false; 
      if (randomPlantCategory.id == randomPlantCategoryCopy.id) { 
        idsEqual = true; 
      } 
      expect(idsEqual, isTrue); 
 
      idsEqual = false; 
      if (randomPlantCategory.id.equals(randomPlantCategoryCopy.id)) { 
        idsEqual = true; 
      } 
      expect(idsEqual, isTrue); 
    }); 
 
    test("New plantCategory action undo and redo", () { 
      var plantCategoryConcept = plantCategories.concept; 
      var plantCategoryCount = plantCategories.length; 
          var plantCategory = new PlantCategory(plantCategories.concept); 
      plantCategory.latinName = 'truck'; 
      plantCategory.description = 'chairman'; 
      plantCategory.isEdible = false; 
      plantCategory.harvestZone = 5828; 
      plantCategories.add(plantCategory); 
      expect(plantCategories.length, equals(++plantCategoryCount)); 
      plantCategories.remove(plantCategory); 
      expect(plantCategories.length, equals(--plantCategoryCount)); 
 
      var action = new AddAction(session, plantCategories, plantCategory); 
      action.doit(); 
      expect(plantCategories.length, equals(++plantCategoryCount)); 
 
      action.undo(); 
      expect(plantCategories.length, equals(--plantCategoryCount)); 
 
      action.redo(); 
      expect(plantCategories.length, equals(++plantCategoryCount)); 
    }); 
 
    test("New plantCategory session undo and redo", () { 
      var plantCategoryConcept = plantCategories.concept; 
      var plantCategoryCount = plantCategories.length; 
          var plantCategory = new PlantCategory(plantCategories.concept); 
      plantCategory.latinName = 'abstract'; 
      plantCategory.description = 'yellow'; 
      plantCategory.isEdible = false; 
      plantCategory.harvestZone = 5252; 
      plantCategories.add(plantCategory); 
      expect(plantCategories.length, equals(++plantCategoryCount)); 
      plantCategories.remove(plantCategory); 
      expect(plantCategories.length, equals(--plantCategoryCount)); 
 
      var action = new AddAction(session, plantCategories, plantCategory); 
      action.doit(); 
      expect(plantCategories.length, equals(++plantCategoryCount)); 
 
      session.past.undo(); 
      expect(plantCategories.length, equals(--plantCategoryCount)); 
 
      session.past.redo(); 
      expect(plantCategories.length, equals(++plantCategoryCount)); 
    }); 
 
    test("PlantCategory update undo and redo", () { 
      var plantCategory = plantCategories.random(); 
      var action = new SetAttributeAction(session, plantCategory, "description", 'done'); 
      action.doit(); 
 
      session.past.undo(); 
      expect(plantCategory.description, equals(action.before)); 
 
      session.past.redo(); 
      expect(plantCategory.description, equals(action.after)); 
    }); 
 
    test("PlantCategory action with multiple undos and redos", () { 
      var plantCategoryCount = plantCategories.length; 
      var plantCategory1 = plantCategories.random(); 
 
      var action1 = new RemoveAction(session, plantCategories, plantCategory1); 
      action1.doit(); 
      expect(plantCategories.length, equals(--plantCategoryCount)); 
 
      var plantCategory2 = plantCategories.random(); 
 
      var action2 = new RemoveAction(session, plantCategories, plantCategory2); 
      action2.doit(); 
      expect(plantCategories.length, equals(--plantCategoryCount)); 
 
      //session.past.display(); 
 
      session.past.undo(); 
      expect(plantCategories.length, equals(++plantCategoryCount)); 
 
      session.past.undo(); 
      expect(plantCategories.length, equals(++plantCategoryCount)); 
 
      //session.past.display(); 
 
      session.past.redo(); 
      expect(plantCategories.length, equals(--plantCategoryCount)); 
 
      session.past.redo(); 
      expect(plantCategories.length, equals(--plantCategoryCount)); 
 
      //session.past.display(); 
    }); 
 
    test("Transaction undo and redo", () { 
      var plantCategoryCount = plantCategories.length; 
      var plantCategory1 = plantCategories.random(); 
      var plantCategory2 = plantCategories.random(); 
      while (plantCategory1 == plantCategory2) { 
        plantCategory2 = plantCategories.random();  
      } 
      var action1 = new RemoveAction(session, plantCategories, plantCategory1); 
      var action2 = new RemoveAction(session, plantCategories, plantCategory2); 
 
      var transaction = new Transaction("two removes on plantCategories", session); 
      transaction.add(action1); 
      transaction.add(action2); 
      transaction.doit(); 
      plantCategoryCount = plantCategoryCount - 2; 
      expect(plantCategories.length, equals(plantCategoryCount)); 
 
      plantCategories.display(title:"Transaction Done"); 
 
      session.past.undo(); 
      plantCategoryCount = plantCategoryCount + 2; 
      expect(plantCategories.length, equals(plantCategoryCount)); 
 
      plantCategories.display(title:"Transaction Undone"); 
 
      session.past.redo(); 
      plantCategoryCount = plantCategoryCount - 2; 
      expect(plantCategories.length, equals(plantCategoryCount)); 
 
      plantCategories.display(title:"Transaction Redone"); 
    }); 
 
    test("Transaction with one action error", () { 
      var plantCategoryCount = plantCategories.length; 
      var plantCategory1 = plantCategories.random(); 
      var plantCategory2 = plantCategory1; 
      var action1 = new RemoveAction(session, plantCategories, plantCategory1); 
      var action2 = new RemoveAction(session, plantCategories, plantCategory2); 
 
      var transaction = new Transaction( 
        "two removes on plantCategories, with an error on the second", session); 
      transaction.add(action1); 
      transaction.add(action2); 
      var done = transaction.doit(); 
      expect(done, isFalse); 
      expect(plantCategories.length, equals(plantCategoryCount)); 
 
      //plantCategories.display(title:"Transaction with an error"); 
    }); 
 
    test("Reactions to plantCategory actions", () { 
      var plantCategoryConcept = plantCategories.concept; 
      var plantCategoryCount = plantCategories.length; 
 
      var reaction = new PlantCategoryReaction(); 
      expect(reaction, isNotNull); 
 
      gardenDomain.startActionReaction(reaction); 
          var plantCategory = new PlantCategory(plantCategories.concept); 
      plantCategory.latinName = 'edition'; 
      plantCategory.description = 'effort'; 
      plantCategory.isEdible = true; 
      plantCategory.harvestZone = 5294; 
      plantCategories.add(plantCategory); 
      expect(plantCategories.length, equals(++plantCategoryCount)); 
      plantCategories.remove(plantCategory); 
      expect(plantCategories.length, equals(--plantCategoryCount)); 
 
      var session = gardenDomain.newSession(); 
      var addAction = new AddAction(session, plantCategories, plantCategory); 
      addAction.doit(); 
      expect(plantCategories.length, equals(++plantCategoryCount)); 
      expect(reaction.reactedOnAdd, isTrue); 
 
      var setAttributeAction = new SetAttributeAction( 
        session, plantCategory, "description", 'consciousness'); 
      setAttributeAction.doit(); 
      expect(reaction.reactedOnUpdate, isTrue); 
      gardenDomain.cancelActionReaction(reaction); 
    }); 
 
  }); 
} 
 
class PlantCategoryReaction implements ActionReactionApi { 
  bool reactedOnAdd    = false; 
  bool reactedOnUpdate = false; 
 
  react(BasicAction action) { 
    if (action is EntitiesAction) { 
      reactedOnAdd = true; 
    } else if (action is EntityAction) { 
      reactedOnUpdate = true; 
    } 
  } 
} 
 
void main() { 
  var repository = new Repository(); 
  var gardenDomain = repository.getDomainModels("Garden");   
  assert(gardenDomain != null); 
  var plantModel = gardenDomain.getModelEntries("Plant");  
  assert(plantModel != null); 
  var plantCategories = plantModel.plantCategories; 
  testGardenPlantPlantCategories(gardenDomain, plantModel, plantCategories); 
} 
 
