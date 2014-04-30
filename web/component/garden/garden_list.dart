import 'dart:html';
import "package:garden_plant/garden_plant.dart"; 
import 'package:polymer/polymer.dart';



/**
 * A Polymer garden-list element.
 */

@CustomTag('garden-list')
class GardenList extends PolymerElement {
  @published Gardens gardens;
  Garden garden;
  @observable bool showAdd = false;
  @observable bool showEdit = false;
  @observable bool showGardenPlants = false;
  //@observable bool selected; 
  


  GardenList.created() : super.created();

  //pour que le bouton montre "Show add" lorsque le composant est invisible et "Hide add" lorsque le composant est visible 
  //et pour contrôler la visiblité du composant
  show(Event e, var detail, Node target) {
      ButtonElement addGarden = shadowRoot.querySelector("#show-add");
      if (addGarden.text == 'Show Add') {
        showAdd = true; //visibilité du composant
        addGarden.text = 'Hide Add'; //texte du bouton
      } else {
        showAdd = false;
        addGarden.text = 'Show Add';
      }
    }
  
  edit(Event e, var detail, Element target) {
      String gardenName = target.attributes['garden-name'];
      garden = gardens.singleWhereAttributeId('name', gardenName);
      showEdit = true;
   }

  delete(Event e, var detail, Element target) {
    String gardenName = target.attributes['garden-name'];
    garden = gardens.singleWhereAttributeId('name', gardenName);
    gardens.remove(garden);
  }
  
  //not working
  saveChange() {
    print('garden_list');
    dispatchEvent(new CustomEvent('saveFromComponent'));
  }

  showPlants(Event e, var detail, Element target) {
    String gardenName = target.attributes['garden-name'];
    ButtonElement gardenPlants = target;
    if (!showGardenPlants && gardenPlants.text == 'Show') {
      showGardenPlants = true;
      garden = gardens.singleWhereAttributeId('name', gardenName);
      gardenPlants.text = 'Hide';
    } else if (showGardenPlants && gardenPlants.text == 'Hide') {
      showGardenPlants = false;
      gardenPlants.text = 'Show';
    }
  } 
}