import "dart:html";
import "package:garden_plant/garden_plant.dart"; 
import 'package:polymer/polymer.dart';
import 'garden_list.dart';


/**
 * A Polymer garden-edit element.
 */

@CustomTag('garden-edit')

class GardenEdit extends PolymerElement {
  @published Gardens gardens; //comment se fait le lien entre garden et gardens, puisqu'ils sont envoyés comme attributs distincts ?
  @published Garden garden;
  @published String description;
  @observable String message;
  GardenList gardenList;
  
  //@published Geoposition geoposition;
    
  GardenEdit.created() : super.created();

    enteredView() {
       super.enteredView();
            
       //pour afficher les données
       description = garden.description;
       //geoposition = garden.geoposition;   
       
     }

    update (Event e, var detail, Node sender) {
   
      //pour attacher l'écran parent
      var polymerApp = querySelector('#polymer-app');
      gardenList = polymerApp.shadowRoot.querySelector('#garden-list');

      //pour les messages d'erreur
      var error = false;
              
         
      //rien à valider
      
     
         if (!error) {
               //on met à jour les données du modèle
               garden.description = description;//newDescription.text;
 
               
               
               //var save= polymerApp.shadowRoot.querySelector('#save');
               //save = "true";
               
               //trying to save, based on http://stackoverflow.com/questions/19040193/how-do-you-dispatch-and-listen-for-custom-events-in-polymer/19040194#19040194
               //print('dispatching from child');
               //dispatchEvent(new CustomEvent('saveChange'));
               //not working
               
               gardens.sort();// to see a new description in the table; but not working
               message = "Garden validated, don't  forget to save !";

           }
   
      gardenList.showEdit = false;
    }


}


 
 

 
 