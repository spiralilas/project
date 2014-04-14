 
// test/garden/plant/garden_plant_garden_test.dart 
 
import "package:unittest/unittest.dart"; 
import "package:dartling/dartling.dart"; 
import "package:garden_plant/garden_plant.dart"; 
 
testGardenPlantGardens( 
    GardenDomain gardenDomain, PlantModel plantModel, Gardens gardens) { 
  DomainSession session; 
  group("Testing Garden.Plant.Garden", () { 
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
      expect(gardens.isEmpty, isFalse); 
    }); 
 
    test("Empty model", () { 
      plantModel.clear(); 
      expect(plantModel.isEmpty, isTrue); 
      expect(gardens.isEmpty, isTrue); 
      expect(gardens.errors.isEmpty, isTrue); 
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
      var json = plantModel.fromEntryToJson("Garden"); 
      expect(json, isNotNull); 
 
      print(json); 
      //plantModel.displayEntryJson("Garden"); 
      //plantModel.displayJson(); 
      //plantModel.display(); 
    }); 
 
    test("From JSON to model entry", () { 
      var json = plantModel.fromEntryToJson("Garden"); 
      gardens.clear(); 
      expect(gardens.isEmpty, isTrue); 
      plantModel.fromJsonToEntry(json); 
      expect(gardens.isEmpty, isFalse); 
 
      gardens.display(title: "From JSON to model entry"); 
    }); 
 
    test("Add garden required error", () { 
      // no required attribute that is not id 
    }); 
 
    test("Add garden unique error", () { 
      var gardenConcept = gardens.concept; 
      var gardenCount = gardens.length; 
      var garden = new Garden(gardenConcept); 
      var randomGarden = gardens.random(); 
      garden.name = randomGarden.name; 
      var added = gardens.add(garden); 
      expect(added, isFalse); 
      expect(gardens.length, equals(gardenCount)); 
      expect(gardens.errors.length, greaterThan(0)); 
 
      gardens.errors.display(title: "Add garden unique error"); 
    }); 
 
    test("Not found garden by new oid", () { 
      var dartlingOid = new Oid.ts(1345648254063); 
      var garden = gardens.singleWhereOid(dartlingOid); 
      expect(garden, isNull); 
    }); 
 
    test("Find garden by oid", () { 
      var randomGarden = gardens.random(); 
      var garden = gardens.singleWhereOid(randomGarden.oid); 
      expect(garden, isNotNull); 
      expect(garden, equals(randomGarden)); 
    }); 
 
    test("Find garden by attribute id", () { 
      var randomGarden = gardens.random(); 
      var garden = 
          gardens.singleWhereAttributeId("name", randomGarden.name); 
      expect(garden, isNotNull); 
      expect(garden.name, equals(randomGarden.name)); 
    }); 
 
    test("Find garden by required attribute", () { 
      // no required attribute that is not id 
    }); 
 
    test("Find garden by attribute", () { 
      var randomGarden = gardens.random(); 
      var garden = 
          gardens.firstWhereAttribute("description", randomGarden.description); 
      expect(garden, isNotNull); 
      expect(garden.description, equals(randomGarden.description)); 
    }); 
 
    test("Select gardens by attribute", () { 
      var randomGarden = gardens.random(); 
      var selectedGardens = 
          gardens.selectWhereAttribute("description", randomGarden.description); 
      expect(selectedGardens.isEmpty, isFalse); 
      selectedGardens.forEach((se) => 
          expect(se.description, equals(randomGarden.description))); 
 
      //selectedGardens.display(title: "Select gardens by description"); 
    }); 
 
    test("Select gardens by required attribute", () { 
      // no required attribute that is not id 
    }); 
 
    test("Select gardens by attribute, then add", () { 
      var randomGarden = gardens.random(); 
      var selectedGardens = 
          gardens.selectWhereAttribute("description", randomGarden.description); 
      expect(selectedGardens.isEmpty, isFalse); 
      expect(selectedGardens.source.isEmpty, isFalse); 
      var gardensCount = gardens.length; 
 
      var garden = new Garden(gardens.concept); 
      garden.name = 'output'; 
      garden.description = 'candy'; 
      garden.geoposition = 'instruction'; 
      var added = selectedGardens.add(garden); 
      expect(added, isTrue); 
      expect(gardens.length, equals(++gardensCount)); 
 
      //selectedGardens.display(title: 
      //  "Select gardens by attribute, then add"); 
      //gardens.display(title: "All gardens"); 
    }); 
 
    test("Select gardens by attribute, then remove", () { 
      var randomGarden = gardens.random(); 
      var selectedGardens = 
          gardens.selectWhereAttribute("description", randomGarden.description); 
      expect(selectedGardens.isEmpty, isFalse); 
      expect(selectedGardens.source.isEmpty, isFalse); 
      var gardensCount = gardens.length; 
 
      var removed = selectedGardens.remove(randomGarden); 
      expect(removed, isTrue); 
      expect(gardens.length, equals(--gardensCount)); 
 
      randomGarden.display(prefix: "removed"); 
      //selectedGardens.display(title: 
      //  "Select gardens by attribute, then remove"); 
      //gardens.display(title: "All gardens"); 
    }); 
 
    test("Sort gardens", () { 
      gardens.sort(); 
 
      //gardens.display(title: "Sort gardens"); 
    }); 
 
    test("Order gardens", () { 
      var orderedGardens = gardens.order(); 
      expect(orderedGardens.isEmpty, isFalse); 
      expect(orderedGardens.length, equals(gardens.length)); 
      expect(orderedGardens.source.isEmpty, isFalse); 
      expect(orderedGardens.source.length, equals(gardens.length)); 
      expect(orderedGardens, isNot(same(gardens))); 
 
      //orderedGardens.display(title: "Order gardens"); 
    }); 
 
    test("Copy gardens", () { 
      var copiedGardens = gardens.copy(); 
      expect(copiedGardens.isEmpty, isFalse); 
      expect(copiedGardens.length, equals(gardens.length)); 
      expect(copiedGardens, isNot(same(gardens))); 
      copiedGardens.forEach((e) => 
        expect(e, equals(gardens.singleWhereOid(e.oid)))); 
      copiedGardens.forEach((e) => 
        expect(e, isNot(same(gardens.singleWhereId(e.id))))); 
 
      //copiedGardens.display(title: "Copy gardens"); 
    }); 
 
    test("True for every garden", () { 
      // no required attribute that is not id 
    }); 
 
    test("Random garden", () { 
      var garden1 = gardens.random(); 
      expect(garden1, isNotNull); 
      var garden2 = gardens.random(); 
      expect(garden2, isNotNull); 
 
      //garden1.display(prefix: "random1"); 
      //garden2.display(prefix: "random2"); 
    }); 
 
    test("Update garden id with try", () { 
      var randomGarden = gardens.random(); 
      var beforeUpdate = randomGarden.name; 
      try { 
        randomGarden.name = 'children'; 
      } on UpdateError catch (e) { 
        expect(randomGarden.name, equals(beforeUpdate)); 
      } 
    }); 
 
    test("Update garden id without try", () { 
      var randomGarden = gardens.random(); 
      var beforeUpdateValue = randomGarden.name; 
      expect(() => randomGarden.name = 'election', throws); 
      expect(randomGarden.name, equals(beforeUpdateValue)); 
    }); 
 
    test("Update garden id with success", () { 
      var randomGarden = gardens.random(); 
      var afterUpdateEntity = randomGarden.copy(); 
      var attribute = randomGarden.concept.attributes.singleWhereCode("name"); 
      expect(attribute.update, isFalse); 
      attribute.update = true; 
      afterUpdateEntity.name = 'distance'; 
      expect(afterUpdateEntity.name, equals('distance')); 
      attribute.update = false; 
      var updated = gardens.update(randomGarden, afterUpdateEntity); 
      expect(updated, isTrue); 
 
      var entity = gardens.singleWhereAttributeId("name", 'distance'); 
      expect(entity, isNotNull); 
      expect(entity.name, equals('distance')); 
 
      //gardens.display("After update garden id"); 
    }); 
 
    test("Update garden non id attribute with failure", () { 
      var randomGarden = gardens.random(); 
      var beforeUpdateValue = randomGarden.description; 
      var afterUpdateEntity = randomGarden.copy(); 
      afterUpdateEntity.description = 'walking'; 
      expect(afterUpdateEntity.description, equals('walking')); 
      // gardens.update can only be used if oid, code or id is set. 
      expect(() => gardens.update(randomGarden, afterUpdateEntity), throws); 
    }); 
 
    test("Copy Equality", () { 
      var randomGarden = gardens.random(); 
      randomGarden.display(prefix:"before copy: "); 
      var randomGardenCopy = randomGarden.copy(); 
      randomGardenCopy.display(prefix:"after copy: "); 
      expect(randomGarden, equals(randomGardenCopy)); 
      expect(randomGarden.oid, equals(randomGardenCopy.oid)); 
      expect(randomGarden.code, equals(randomGardenCopy.code)); 
      expect(randomGarden.name, equals(randomGardenCopy.name)); 
      expect(randomGarden.description, equals(randomGardenCopy.description)); 
      expect(randomGarden.geoposition, equals(randomGardenCopy.geoposition)); 
 
      expect(randomGarden.id, isNotNull); 
      expect(randomGardenCopy.id, isNotNull); 
      expect(randomGarden.id, equals(randomGardenCopy.id)); 
 
      var idsEqual = false; 
      if (randomGarden.id == randomGardenCopy.id) { 
        idsEqual = true; 
      } 
      expect(idsEqual, isTrue); 
 
      idsEqual = false; 
      if (randomGarden.id.equals(randomGardenCopy.id)) { 
        idsEqual = true; 
      } 
      expect(idsEqual, isTrue); 
    }); 
 
    test("New garden action undo and redo", () { 
      var gardenConcept = gardens.concept; 
      var gardenCount = gardens.length; 
          var garden = new Garden(gardens.concept); 
      garden.name = 'entertainment'; 
      garden.description = 'theme'; 
      garden.geoposition = 'baby'; 
      gardens.add(garden); 
      expect(gardens.length, equals(++gardenCount)); 
      gardens.remove(garden); 
      expect(gardens.length, equals(--gardenCount)); 
 
      var action = new AddAction(session, gardens, garden); 
      action.doit(); 
      expect(gardens.length, equals(++gardenCount)); 
 
      action.undo(); 
      expect(gardens.length, equals(--gardenCount)); 
 
      action.redo(); 
      expect(gardens.length, equals(++gardenCount)); 
    }); 
 
    test("New garden session undo and redo", () { 
      var gardenConcept = gardens.concept; 
      var gardenCount = gardens.length; 
          var garden = new Garden(gardens.concept); 
      garden.name = 'email'; 
      garden.description = 'head'; 
      garden.geoposition = 'policeman'; 
      gardens.add(garden); 
      expect(gardens.length, equals(++gardenCount)); 
      gardens.remove(garden); 
      expect(gardens.length, equals(--gardenCount)); 
 
      var action = new AddAction(session, gardens, garden); 
      action.doit(); 
      expect(gardens.length, equals(++gardenCount)); 
 
      session.past.undo(); 
      expect(gardens.length, equals(--gardenCount)); 
 
      session.past.redo(); 
      expect(gardens.length, equals(++gardenCount)); 
    }); 
 
    test("Garden update undo and redo", () { 
      var garden = gardens.random(); 
      var action = new SetAttributeAction(session, garden, "description", 'cream'); 
      action.doit(); 
 
      session.past.undo(); 
      expect(garden.description, equals(action.before)); 
 
      session.past.redo(); 
      expect(garden.description, equals(action.after)); 
    }); 
 
    test("Garden action with multiple undos and redos", () { 
      var gardenCount = gardens.length; 
      var garden1 = gardens.random(); 
 
      var action1 = new RemoveAction(session, gardens, garden1); 
      action1.doit(); 
      expect(gardens.length, equals(--gardenCount)); 
 
      var garden2 = gardens.random(); 
 
      var action2 = new RemoveAction(session, gardens, garden2); 
      action2.doit(); 
      expect(gardens.length, equals(--gardenCount)); 
 
      //session.past.display(); 
 
      session.past.undo(); 
      expect(gardens.length, equals(++gardenCount)); 
 
      session.past.undo(); 
      expect(gardens.length, equals(++gardenCount)); 
 
      //session.past.display(); 
 
      session.past.redo(); 
      expect(gardens.length, equals(--gardenCount)); 
 
      session.past.redo(); 
      expect(gardens.length, equals(--gardenCount)); 
 
      //session.past.display(); 
    }); 
 
    test("Transaction undo and redo", () { 
      var gardenCount = gardens.length; 
      var garden1 = gardens.random(); 
      var garden2 = gardens.random(); 
      while (garden1 == garden2) { 
        garden2 = gardens.random();  
      } 
      var action1 = new RemoveAction(session, gardens, garden1); 
      var action2 = new RemoveAction(session, gardens, garden2); 
 
      var transaction = new Transaction("two removes on gardens", session); 
      transaction.add(action1); 
      transaction.add(action2); 
      transaction.doit(); 
      gardenCount = gardenCount - 2; 
      expect(gardens.length, equals(gardenCount)); 
 
      gardens.display(title:"Transaction Done"); 
 
      session.past.undo(); 
      gardenCount = gardenCount + 2; 
      expect(gardens.length, equals(gardenCount)); 
 
      gardens.display(title:"Transaction Undone"); 
 
      session.past.redo(); 
      gardenCount = gardenCount - 2; 
      expect(gardens.length, equals(gardenCount)); 
 
      gardens.display(title:"Transaction Redone"); 
    }); 
 
    test("Transaction with one action error", () { 
      var gardenCount = gardens.length; 
      var garden1 = gardens.random(); 
      var garden2 = garden1; 
      var action1 = new RemoveAction(session, gardens, garden1); 
      var action2 = new RemoveAction(session, gardens, garden2); 
 
      var transaction = new Transaction( 
        "two removes on gardens, with an error on the second", session); 
      transaction.add(action1); 
      transaction.add(action2); 
      var done = transaction.doit(); 
      expect(done, isFalse); 
      expect(gardens.length, equals(gardenCount)); 
 
      //gardens.display(title:"Transaction with an error"); 
    }); 
 
    test("Reactions to garden actions", () { 
      var gardenConcept = gardens.concept; 
      var gardenCount = gardens.length; 
 
      var reaction = new GardenReaction(); 
      expect(reaction, isNotNull); 
 
      gardenDomain.startActionReaction(reaction); 
          var garden = new Garden(gardens.concept); 
      garden.name = 'beginning'; 
      garden.description = 'present'; 
      garden.geoposition = 'sand'; 
      gardens.add(garden); 
      expect(gardens.length, equals(++gardenCount)); 
      gardens.remove(garden); 
      expect(gardens.length, equals(--gardenCount)); 
 
      var session = gardenDomain.newSession(); 
      var addAction = new AddAction(session, gardens, garden); 
      addAction.doit(); 
      expect(gardens.length, equals(++gardenCount)); 
      expect(reaction.reactedOnAdd, isTrue); 
 
      var setAttributeAction = new SetAttributeAction( 
        session, garden, "description", 'organization'); 
      setAttributeAction.doit(); 
      expect(reaction.reactedOnUpdate, isTrue); 
      gardenDomain.cancelActionReaction(reaction); 
    }); 
 
  }); 
} 
 
class GardenReaction implements ActionReactionApi { 
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
  var gardens = plantModel.gardens; 
  testGardenPlantGardens(gardenDomain, plantModel, gardens); 
} 
 
