import 'dart:html';
import 'package:garden_plant/garden_plant.dart';
import 'package:polymer/polymer.dart';
import 'garden_visit.dart';

@CustomTag('specimen-edit')
class SpecimenEdit extends PolymerElement {
  @published Garden garden;
  @published Plants plants;
  @published Plant plant;
  @published PlantCategories plantCategories;
  @published String latinName;
  @published String name;
  @published String description;
  @published String picture;

  SpecimenEdit.created() : super.created();

  enteredView() {
    super.enteredView();
    plants = garden.plants;
    plants.internalList = toObservable(plants.internalList);
    name = plant.name;
    description = plant.description;
    picture = plant.picture;
    latinName = plant.plantCategory.latinName;
  }

  update(Event e, var detail, Node target) {
 
    Element message = $['message'];
    //validating data
    var error = false;
    message.text = '';

    //validating name, because we allow for changing it
    if (name.trim() == '') {
      message.text = 'This specimen deserves a name !; ${message.text}';
      error = true;
    }
    
    //saving
    /**
     * S'il n'y a pas d'erreur
     *   vérifier si la plante existe encore et si elle a le même nom
     *   si la plante a changé de nom
     *     si le nouveau nom correspond au nom d'une autre plante
             erreur 
           sinon         
             enlever l'ancienne plante
             enregistrer la nouvelle plante
           fin si
         sinon
           enregistrer la plante
         fin si
       sinon
         rien, le message a déjà été affiché
       fin si
     **/
    
    if (!error) {
      if (plant.name != name) {
        var existingPlant = plants.singleWhereAttributeId('name', name);
        
        if (existingPlant != null) {
          message.text = 'You already have a specimen with this name';
        } else {
          plants.remove(plant);
          plant = new Plant(plants.concept);
          plant.name = name;
          plant.description = description;
          plant.picture = picture;
          plant.garden = garden;
          plant.plantCategory = plantCategories.singleWhereAttributeId('latinName', latinName);
          if (plants.add(plant)) {
            message.text = "Specimen updated. Don't forget to save !";
          } else {
            message.text = 'Oops! Specimen not updated';
          }
        }
      } else {
        plant.description = description;
        plant.picture = picture;
      }
      plants.sort(); // even if name not changed, to see the updated table
      var polymerApp = querySelector('#polymer-app');
      var gardenList = polymerApp.shadowRoot.querySelector('#garden-list');
      GardenVisit gardenVisit = gardenList.shadowRoot.querySelector('#garden-visit');
      gardenVisit.showEdit = false;
    }
  }
}
