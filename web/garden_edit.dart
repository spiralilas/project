//import "package:dartling_default_app/dartling_default_app.dart"; 
import "package:garden_plant/garden_plant.dart"; 

import 'package:polymer/polymer.dart';

/**
 * A Polymer garden-edit element.
 */

@CustomTag('garden-edit')

class GardenEdit extends PolymerElement {
  @observable String header="Add a garden";
  @observable String name="name";
  @observable String description;
  @observable String geoposition;

  GardenEdit.created() : super.created() {

  }


/**  void increment() {
    count++;
  }*/
}

 
 

 
 