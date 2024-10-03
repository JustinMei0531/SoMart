import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:management_system/controllers/add_product_controller.dart";
import "package:management_system/widgets/custom_textfield.dart";
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:management_system/widgets/nutrition_table.dart";

class AddProductPage extends StatelessWidget {
  AddProductPage({super.key});

  final AddProductController addProductController =
      Get.put(AddProductController());

  final List<TextEditingController> controllerList = [];

  final List<String> nutritionLabelList = [
    "Energy",
    "Protein",
    "Fat, Total",
    "Saturated",
    "Trans",
    "Polyunsaturated",
    "Monounsaturated",
    "Carbohydrate",
    "Sugars",
    "Dietary Fibre",
    "Sodium"
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      "Add New Product",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          letterSpacing: 1.5),
                    ),
                    ElevatedButton(
                      onPressed: addProductController.onPublishButtonClicked,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(5, 113, 106, 1.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      child: const Text(
                        "Publish",
                        style: TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 6,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Basic",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black87,
                                      letterSpacing: 0.5),
                                ),
                              ),
                            ),
                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Product name",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color:
                                              Color.fromRGBO(79, 93, 119, 1.0)),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    cursorWidth: 1.0,
                                    cursorColor: Colors.black87,
                                    obscureText: false,
                                    style: const TextStyle(
                                        color: Colors.black87, fontSize: 12.0),
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black, width: 0),
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                      ),
                                      hintText: "Type here",
                                      hintStyle: const TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                      labelStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color.fromRGBO(
                                                  244, 245, 249, 1.0),
                                              width: 0),
                                          borderRadius:
                                              BorderRadius.circular(2.0)),
                                      floatingLabelStyle: const TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Product description",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color:
                                              Color.fromRGBO(79, 93, 119, 1.0)),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  TextField(
                                    cursorWidth: 1.0,
                                    cursorColor: Colors.black87,
                                    obscureText: false,
                                    style: const TextStyle(
                                        color: Colors.black87, fontSize: 12.0),
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black, width: 0),
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                      ),
                                      hintText:
                                          "Input product description less than 1500 words",
                                      hintStyle: const TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                      labelStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color.fromRGBO(
                                                  244, 245, 249, 1.0),
                                              width: 0),
                                          borderRadius:
                                              BorderRadius.circular(2.0)),
                                      floatingLabelStyle: const TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                    maxLines: null,
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            const Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "Regular price",
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: Color.fromRGBO(
                                                      79, 93, 119, 1.0),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5.0,
                                            ),
                                            TextField(
                                              cursorWidth: 1.0,
                                              cursorColor: Colors.black87,
                                              obscureText: false,
                                              style: const TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 12.0),
                                              decoration: InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.black,
                                                      width: 0),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.0),
                                                ),
                                                hintText: "Type here",
                                                hintStyle: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12),
                                                prefixIcon:
                                                    const Icon(Icons.money),
                                                labelStyle: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        244,
                                                                        245,
                                                                        249,
                                                                        1.0),
                                                                width: 0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2.0)),
                                                floatingLabelStyle:
                                                    const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 5.0),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            const Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "Discounted price",
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: Color.fromRGBO(
                                                      79, 93, 119, 1.0),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 5.0),
                                            TextField(
                                              cursorWidth: 1.0,
                                              cursorColor: Colors.black87,
                                              obscureText: false,
                                              style: const TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 12.0),
                                              decoration: InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.black,
                                                      width: 0),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.0),
                                                ),
                                                hintText: "Type here",
                                                hintStyle: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12),
                                                prefixIcon:
                                                    const Icon(Icons.money),
                                                labelStyle: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        244,
                                                                        245,
                                                                        249,
                                                                        1.0),
                                                                width: 0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2.0)),
                                                floatingLabelStyle:
                                                    const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Product ID",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color.fromRGBO(79, 93, 119, 1.0),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 4,
                                        child: Obx(
                                            () => TextField(
                                              cursorWidth: 1.0,
                                              cursorColor: Colors.black87,
                                              obscureText: false,
                                              style: const TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 12.0),
                                              decoration: InputDecoration(
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.black,
                                                      width: 0),
                                                  borderRadius:
                                                  BorderRadius.circular(2.0),
                                                ),
                                                prefixIcon: addProductController.isValidID.value ?
                                                const Icon(Icons.verified, color: Colors.green,) : const Icon(Icons.error, color: Colors.red,),
                                                hintText: addProductController.idHintText.value,
                                                hintStyle: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12),
                                                labelStyle: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400),
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                        color: Color.fromRGBO(
                                                            244, 245, 249, 1.0),
                                                        width: 0),
                                                    borderRadius:
                                                    BorderRadius.circular(2.0)),
                                                floatingLabelStyle: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18),
                                              ),
                                            )
                                        ),
                                      ),
                                      const Spacer(),
                                      Expanded(
                                        flex: 3,
                                        child: ElevatedButton(
                                          onPressed: addProductController.onTestIDButtonClicked,

                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromRGBO(
                                                    5, 113, 106, 1.0),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0)),
                                          ),
                                          child: const Text(
                                            "Test ID",
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Expanded(
                                        flex: 3,
                                        child: ElevatedButton(
                                          onPressed: addProductController
                                              .onAllocateIDButtonClicked,
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromRGBO(
                                                    5, 113, 106, 1.0),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0)),
                                          ),
                                          child: const Text(
                                            "Automatic allocate",
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          children: <Widget>[
                            const Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Media",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.black87,
                                          letterSpacing: 0.5),
                                    ),
                                  ),
                                ),
                                Divider(),
                              ],
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Column(
                              children: <Widget>[

                                SizedBox(
                                  width: double.infinity,
                                  height: 300.0,
                                  child: Obx(() => ListView.builder(
                                    itemCount: addProductController.selectedImages.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => InkWell(
                                      onTap: () {
                                        addProductController.showImagePreview(addProductController.selectedImages[index].bytes);
                                      },
                                      child: ListTile(
                                        leading:
                                        Image.memory(addProductController.selectedImages[index].bytes, ),
                                        title: Text(addProductController.selectedImages[index].name),
                                        trailing: IconButton(
                                          onPressed: () {
                                            addProductController.onDeleteSelectedImage(index);
                                          },
                                          icon: const Icon(Icons.delete, color: Color.fromRGBO(
                                              5, 113, 106, 1.0),),
                                        ),

                                      ),
                                    ),
                                  )),
                                ),

                                const SizedBox(
                                  height: 15.0,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(232, 235, 238, 1.0),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      ElevatedButton(
                                        onPressed:
                                            addProductController.pickImages,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromRGBO(
                                              5, 113, 106, 1.0),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                        ),
                                        child: const Text(
                                          "Select",
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8.0,
                                      ),
                                      Obx(
                                        () => Flexible(
                                          // Ensure the text takes only the available space
                                          child: Text(
                                            addProductController
                                                .imageInfo.value,
                                            overflow: TextOverflow
                                                .ellipsis, // Truncate with ellipsis
                                            maxLines:
                                                1, // Set the number of lines to 1
                                            style: const TextStyle(
                                                fontSize:
                                                    14.0), // Optional: set the text style
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 6,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Nutrition Information",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black87,
                                      letterSpacing: 0.5),
                                ),
                              ),
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 10.0,
                            ),

                            NutritionTable(
                              paddingValue: const EdgeInsets.all(10.0),
                              controllerList: controllerList,
                              labelList: nutritionLabelList,
                            ),

                            const SizedBox(
                              height: 5.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: ElevatedButton(
                                  onPressed: addProductController
                                      .onCleanAllButtonClicked,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(5, 113, 106, 1.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  ),
                                  child: const Text(
                                    "Clean all",
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          children: <Widget>[
                            const Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Organization",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.black87,
                                          letterSpacing: 0.5),
                                    ),
                                  ),
                                ),
                                Divider(),
                              ],
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Category",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color.fromRGBO(79, 93, 119, 1.0),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Obx(() => DropdownButtonFormField(
                                        decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black, width: 0),
                                            borderRadius:
                                                BorderRadius.circular(2.0),
                                          ),
                                          hintText: "Select product category",
                                          hintStyle: const TextStyle(
                                              color: Colors.grey, fontSize: 14),
                                          labelStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color.fromRGBO(
                                                      244, 245, 249, 1.0),
                                                  width: 0),
                                              borderRadius:
                                                  BorderRadius.circular(2.0)),
                                          floatingLabelStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                        ),
                                        dropdownColor: const Color.fromRGBO(
                                            202, 224, 222, 1.0),
                                        isExpanded: true,
                                        items: addProductController.categoryList
                                            .map((category) {
                                          return DropdownMenuItem<
                                              Map<String, dynamic>>(
                                            value: category,
                                            child:
                                                Text(category['category_name']),
                                          );
                                        }).toList(),
                                        onChanged: (value) {},
                                      )),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Tag",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color.fromRGBO(79, 93, 119, 1.0),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  TextField(
                                    cursorWidth: 1.0,
                                    cursorColor: Colors.black87,
                                    obscureText: false,
                                    style: const TextStyle(
                                        color: Colors.black87, fontSize: 12.0),
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black, width: 0),
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                      ),
                                      hintText: "Type here",
                                      hintStyle: const TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                      prefixIcon: const Icon(Icons.tag),
                                      labelStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color.fromRGBO(
                                                  244, 245, 249, 1.0),
                                              width: 0),
                                          borderRadius:
                                              BorderRadius.circular(2.0)),
                                      floatingLabelStyle: const TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
