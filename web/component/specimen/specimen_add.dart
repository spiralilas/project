import 'dart:html';
import 'package:garden_plant/garden_plant.dart';
import 'package:polymer/polymer.dart';

@CustomTag('specimen-add')
class SpecimenAdd extends PolymerElement {
  @published Garden garden;
  @published PlantCategories plantCategories;
  @published PlantCategory plantCategory;
  
  SpecimenAdd.created() : super.created();
  

  add(Event e, var detail, Node target) {
    InputElement name = $['name'];
    InputElement description = $['description'];
    InputElement picture = $['picture'];
    InputElement latinName = $['latinName'];//ne se remplit pas...
    Element message = $['message'];
    
    var error = false;
    message.text = '';
    if (name.value.trim() == '') {
      message.text = 'This plant specimen deserves a name !; ${message.text}';
      error = true;
    }
    if (!error) {
      var plant = new Plant(garden.plants.concept);
      plant.name = name.value;
      plant.description = description.value;
      plant.picture = picture.value;//compléter avec http://www.html5rocks.com/en/tutorials/getusermedia/intro/
      plant.garden = garden;
      plant.plantCategory = plantCategories.singleWhereAttributeId('latinName', latinName);
      if (garden.plants.add(plant)) {
        message.text = 'added';
        garden.plants.sort();
      } else {
        message.text = 'This specimen is already in the garden !';
      }
    }
  }
}