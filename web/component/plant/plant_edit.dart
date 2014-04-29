import "dart:html";
import "package:garden_plant/garden_plant.dart"; 
import 'package:polymer/polymer.dart';
import 'plant_list.dart';


/**
 * A Polymer garden-edit element.
 */

@CustomTag('plant-edit')

class PlantEdit extends PolymerElement {
  @published PlantCategories plantCategories;
  @published PlantCategory plantCategory;
  @published String description;
  @published bool isEdible;
  @published var harvestZone;
  @observable String message;
  PlantList plantList;

    
  PlantEdit.created() : super.created();

    enteredView() {
       super.enteredView();
            
       //pour afficher les données
       description = plantCategory.description;
       isEdible = plantCategory.isEdible;
       harvestZone = plantCategory.harvestZone;       
     }

    update (Event e, var detail, Node sender) {
   
      //pour attacher l'écran parent
      var polymerApp = querySelector('#polymer-app');
      plantList = polymerApp.shadowRoot.querySelector('#plant-list');

      //pour les messages d'erreur
      var error = false;
              
         
      //validation des données saisies
      //valider isEdible
      
      if (harvestZone.value.trim() != '') {
        try {
          int zone = int.parse(harvestZone.value);
        } catch(e) {
          message = 'Harvest zone must be an integer; ${message}';
          error = true;
        } 
      }  
             
         if (!error) {
               //on met à jour les données du modèle
               plantCategory.description = description;
               plantCategory.isEdible = isEdible;
               plantCategory.harvestZone = harvestZone;
           
               plantCategories.sort();// to see a new description in the table; but not working
               message = "Plant validated, don't  forget to save !";

           }
   
      plantList.showEdit = false;
    }

}