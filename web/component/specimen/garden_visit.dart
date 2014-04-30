import 'dart:html';
import 'package:garden_plant/garden_plant.dart';
import 'package:polymer/polymer.dart';

@CustomTag('garden-visit')
class GardenVisit extends PolymerElement {
  @published Garden garden;
  @published Plants plants;
  Plant plant;
  @published PlantCategories plantCategories;
  PlantCategory plantCategory;
  @observable bool showAdd = false;
  @observable bool showEdit = false;

  GardenVisit.created() : super.created();

  enteredView() {
    super.enteredView();
    plants = garden.plants;
    plants.internalList = toObservable(plants.internalList);
  }

  show(Event e, var detail, Node target) {
    ButtonElement addLink = $['show-add'];
    if (addLink.text == 'Show Add') {
      showAdd = true;
      addLink.text = 'Hide Add';
    } else {
      showAdd = false;
      addLink.text = 'Show Add';
    }
  }

  edit(Event e, var detail, Element target) {
    String plantName = target.attributes['plant-name'];
    plant = plants.firstWhereAttribute('name', plantName);
    showEdit = true;
  }
}