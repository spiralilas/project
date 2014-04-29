import 'dart:html';
import "package:garden_plant/garden_plant.dart"; 
import 'package:polymer/polymer.dart';

/**
 * A Polymer plant-list element.
 */

@CustomTag('plant-list')
class PlantList extends PolymerElement {

  @published PlantCategories plantCategories;
  PlantCategory plantCategory;
  @observable bool showAdd = false;
  @observable bool showEdit = false;
  
  PlantList.created() : super.created();

  show(Event e, var detail, Node target) {
        ButtonElement addPlant = shadowRoot.querySelector("#show-add");
        if (addPlant.text == 'Show Add') {
          showAdd = true; //visibilité du composant
          addPlant.text = 'Hide Add'; //texte du bouton
        } else {
          showAdd = false;
          addPlant.text = 'Show Add';
        }
      }
    
    edit(Event e, var detail, Element target) {
        String plantCategoryLatinName = target.attributes['plantCategory-latinName'];
        plantCategory = plantCategories.singleWhereAttributeId('latinName', plantCategoryLatinName);
        showEdit = true;
     }

    delete(Event e, var detail, Element target) {
      String plantCategoryLatinName = target.attributes['plantCategory-latinName'];
      plantCategory = plantCategories.singleWhereAttributeId('latinName', plantCategoryLatinName);
      plantCategories.remove(plantCategory);
    }
}