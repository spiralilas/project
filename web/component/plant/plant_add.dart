import 'dart:html';
import "package:garden_plant/garden_plant.dart"; 
import 'package:polymer/polymer.dart';

@CustomTag('plant-add')
class PlantAdd extends PolymerElement {
  @published PlantCategories plantCategories;

  PlantAdd.created() : super.created();

  //le bouton add valide les données mais ne sauvegarde pas...
  add(Event e, var detail, Node target) {
    
    //il faut attacher les champs en Input (pourquoi? je croyais que polymer le faisait?)
    InputElement latinName = shadowRoot.querySelector("#latinName");
    var description = shadowRoot.querySelector("#description");
    InputElement isEdible = shadowRoot.querySelector("#isEdible");
    InputElement harvestZone = shadowRoot.querySelector("#harvestZone");
    Element message = shadowRoot.querySelector("#message");

    //pour les messages d'erreur
    var error = false;
    message.text = '';
    
    //validation des données saisies
    if (latinName.value.trim() == '') {
      message.text = 'Latin name is mandatory; ${message.text}';
      error = true;
    }
    
    //valider isEdible
/**
    if (harvestZone.value.trim() != '') {
      try {
        int zone = int.parse(harvestZone.value);//ça plante ici...pourquoi ???
      } catch(e) {
        message.text = 'Harvest zone must be an integer; ${message.text}';
        error = true;
      } 
    }
 **/
  
    if (!error) {
      var plantCategory = new PlantCategory(plantCategories.concept);
      plantCategory.latinName = latinName.value;
      plantCategory.description = description.value;
      if (isEdible.value == 'true') {
        plantCategory.isEdible = true;
      } else {
        plantCategory.isEdible = false;
      }
      if (harvestZone.value.trim() != '') {
        plantCategory.harvestZone = int.parse(harvestZone.value);
      }
      
      if (plantCategories.add(plantCategory)) {
        message.text = "Plant validated, don't  forget to save !";
        plantCategories.sort();
      } else {
        message.text = "This plant is already in the system";
      }
    }
  }
}