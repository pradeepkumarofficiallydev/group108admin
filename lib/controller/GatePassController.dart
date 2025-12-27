import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GatePassController extends GetxController {
  TextEditingController personName = TextEditingController();
  TextEditingController vehicleNo = TextEditingController();
  TextEditingController totalQty = TextEditingController();

  RxList<ItemModel> items = <ItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    addItem(); // start with 1 item
  }

  void addItem() {
    items.add(ItemModel());
    calculateTotalQty();
  }

  void removeItem(int index) {
    items.removeAt(index);
    calculateTotalQty();
  }

  void calculateTotalQty() {
    int sum = 0;
    for (var item in items) {
      int qty = int.tryParse(item.qty.text) ?? 0;
      sum += qty;
    }
    totalQty.text = sum.toString();
  }


  Map<String, dynamic> buildRequest() {
    Map<String, dynamic> data = {
      "person_name": personName.text,
      "vehicle_number": vehicleNo.text,
      "qty": int.tryParse(totalQty.text) ?? 0,
      "tenant_id": 1,
      "tenant_name": "Jane Smith",
      "tenant_unit": "A-101",



    };


    for (int i = 0; i < items.length; i++) {
      int index = i + 1;
      data["item_${index}_name"] = items[i].name.text;
      data["item_${index}_qty"] = int.tryParse(items[i].qty.text) ?? 0;
      data["item_${index}_description"] = items[i].description.text;
    }

    return data;
  }
}




class ItemModel {
  TextEditingController name = TextEditingController();
  TextEditingController qty = TextEditingController();
  TextEditingController description = TextEditingController();
}

