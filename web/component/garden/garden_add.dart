import 'dart:html';
import "package:garden_plant/garden_plant.dart"; 
import 'package:polymer/polymer.dart';

@CustomTag('garden-add')
class GardenAdd extends PolymerElement {
  @published Gardens gardens;

  GardenAdd.created() : super.created();

  //le bouton add valide les données mais ne sauvegarde pas...
  add(Event e, var detail, Node target) {
    
    //il faut attacher les champs en Input (pourquoi? je croyais que polymer le faisait?)
    InputElement name = shadowRoot.querySelector("#name");
    InputElement description = shadowRoot.querySelector("#description");
    InputElement geoposition = shadowRoot.querySelector("#geoposition");
    Element message = shadowRoot.querySelector("#message");
    
    //pour les messages d'erreur
    var error = false;
    message.text = '';
    
    //validation des données saisies
    if (name.value.trim() == '') {
      message.text = 'Garden name is mandatory; ${message.text}';
      error = true;
    }
    
    /**  conservé comme exemple pour une validation de integer
    if (harvestZone.value.trim() != '') {
      try {
        int zone = int.parse(harvestZone.value);
      } catch(e) {
        message.text = 'zone must be integer; ${message.text}';
        error = true;
      } 
    }
    **/
    
    //Rien à valider sur la description
    
    //Validation geoposition à venir
    
    if (!error) {
      var garden = new Garden(gardens.concept);
      garden.name = name.value;
      garden.description = description.value;
      //pour l'instant, geoposition est toujours vide, à venir

      if (gardens.add(garden)) {
        message.text = "Garden validated, don't  forget to save !";
        gardens.sort();
      } else {
        message.text = "Please choose another name for your garden";
      }
    }
  }
}