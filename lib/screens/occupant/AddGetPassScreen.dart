// add_gate_pass_screen.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import '../../Utils/AppColors.dart';
import '../../Utils/Strings.dart';
import '../../Utils/custom_widgets.dart';

class AddGatePassScreen extends StatefulWidget {
  const AddGatePassScreen({Key? key}) : super(key: key);

  @override
  _AddGatePassScreenState createState() => _AddGatePassScreenState();
}

class _AddGatePassScreenState extends State<AddGatePassScreen> {
  final TextEditingController _personName = TextEditingController();
  final TextEditingController _vehicleNo = TextEditingController();
  final TextEditingController _totalQty = TextEditingController();
  final List<ItemModel> _items = [];


var isLoading=false;
  @override
  void initState() {
    super.initState();
    addItem(); // start with one item
    _totalQty.text = '0';
  }

  @override
  void dispose() {
    _personName.dispose();
    _vehicleNo.dispose();
    _totalQty.dispose();
    for (var it in _items) {
      it.dispose();
    }
    super.dispose();
  }

  void addItem() {
    setState(() {
      _items.add(ItemModel());
    });
    calculateTotal();
  }

  void removeItem(int index) {
    if (index < 0 || index >= _items.length) return;
    setState(() {
      _items[index].dispose();
      _items.removeAt(index);
    });
    calculateTotal();
  }

  void calculateTotal() {
    int sum = 0;
    for (var it in _items) {
      sum += int.tryParse(it.qty.text) ?? 0;
    }
    _totalQty.text = sum.toString();
    setState(() {}); // update UI
  }

  Map<String, dynamic> buildRequestJson() {
    final Map<String, dynamic> data = {
      "person_name": _personName.text,
      "vehicle_number": _vehicleNo.text,
      "qty": int.tryParse(_totalQty.text) ?? 0,
      "tenant_id": 1,
      "tenant_name": "Jane Smith",
      "tenant_unit": "A-101",
    };

    for (int i = 0; i < _items.length; i++) {
      int idx = i + 1;
      data["item_${idx}_name"] = _items[i].name.text;
      data["item_${idx}_qty"] = int.tryParse(_items[i].qty.text) ?? 0;
      data["item_${idx}_description"] = _items[i].description.text;
    }

    return data;
  }

  Future<void> submitGatePass() async {
    final jsonBody = buildRequestJson();
    print("Request JSON: ${jsonEncode(jsonBody)}");

    // Example POST request (uncomment and replace URL)
    isLoading=true;

    setState(() {

    });


    final url = Uri.parse(Strings.Url+"api/flutter_add_gate_pass");
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(jsonBody),
    );


    isLoading=false;

    setState(() {

    });


    if (response.statusCode == 201) {




      Get.snackbar(


        "Your gate pass has been created successfully.",
        "",
        backgroundColor: AppColor.whitecolor,
        forwardAnimationCurve: Curves.easeOutBack,
        snackPosition: SnackPosition.BOTTOM,

      );



    //  "Gate pass created successfully
      // success
      print('Submitted successfully: ${response.body}');
    } else {
      print('Submit failed: ${response.statusCode} ${response.body}');
    }




  }

  InputDecoration _inputDeco() {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      filled: true,
      fillColor: Colors.white,
    );
  }

  Widget _itemCard(int index) {
    final item = _items[index];
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text('Item ${index + 1}', style: TextStyle(fontWeight: FontWeight.bold))),
              IconButton(
                onPressed: () => removeItem(index),
                icon: Icon(Icons.delete, color: Colors.blue),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text('Item Name'),
          SizedBox(height: 6),
          TextField(controller: item.name, decoration: _inputDeco()),
          SizedBox(height: 12),
          Text('Quantity'),
          SizedBox(height: 6),
          TextField(
            controller: item.qty,
            keyboardType: TextInputType.number,
            decoration: _inputDeco(),
            onChanged: (_) => calculateTotal(),
          ),
          SizedBox(height: 12),
          Text('Description'),
          SizedBox(height: 6),
          TextField(controller: item.description, decoration: _inputDeco()),
        ],
      ),
    );
  }




  @override
  Widget build(BuildContext context) {


    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio


    // Use a light scaffold background like your design
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Add Gate Pass"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        leading: BackButton(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Person Name', style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 6),
              TextField(controller: _personName, decoration: _inputDeco()),
              SizedBox(height: 16),

              Text('Vehicle No.', style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 6),
              TextField(controller: _vehicleNo, decoration: _inputDeco()),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Material Details', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextButton.icon(
                    onPressed: addItem,
                    icon: Icon(Icons.add),
                    label: Text('Add Item'),
                  )
                ],
              ),
              SizedBox(height: 8),

              // Items list
              ...List.generate(_items.length, (i) => _itemCard(i)),

              SizedBox(height: 8),
              Text('Total Quantity (Auto-calculated)', style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 8),
              TextField(controller: _totalQty, readOnly: true, decoration: _inputDeco()),
              SizedBox(height: 110), // space for floating button
            ],
          ),
        ),
      ),

  //     floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  //     floatingActionButton: GradientButton(
  //
  //
  //       text: "Submit gate pass",
  //       onTap: () async {
  //         calculateTotal();
  //         await submitGatePass();
  //       },
  //     ),







      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:

      isLoading ?
      Center(child: CustomWidgets.showCircularIndicator1(context,height*.9,AppColor.blackcolor)):


       GestureDetector(
          onTap: () {
            print("Add Gate Pass Pressed");
          },
          child:
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Row(
              children: [
                const SizedBox(width: 12),
                Expanded(
                  child:



                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () async {

                            calculateTotal();
                             await submitGatePass();

                    },
                    child: const Text("Submit gate pass",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),


              ],
            ),
          )



      ),






    );



    }
  //



}

class ItemModel {
  final TextEditingController name = TextEditingController();
  final TextEditingController qty = TextEditingController();
  final TextEditingController description = TextEditingController();

  void dispose() {
    name.dispose();
    qty.dispose();
    description.dispose();
  }

}



/// GradientButton widget (defined here so it's in the same file and in-scope)
class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const GradientButton({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Wrap with Material so tap ripple shows
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 36, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFF4C8DCC),
                Color(0xFF052E57),
              ],
            ),
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3)),
            ],
          ),
          child: Text(text, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}


