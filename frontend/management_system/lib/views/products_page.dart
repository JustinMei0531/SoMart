import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:management_system/controllers/add_product_controller.dart";
import "package:management_system/controllers/products_controller.dart";
import "package:management_system/http/apis.dart";
import "package:management_system/widgets/custom_textfield.dart";
import "package:management_system/widgets/product_item.dart";

class ProductsPage extends StatelessWidget {
  ProductsPage({super.key});


  final ProductsController productsController = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFF8F9FA),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
              .copyWith(surface: Colors.white)
      ),
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
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Products List", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black54, letterSpacing: 1.5),),
                        SizedBox(height: 5.0),
                        Text(
                          "All products are shown here",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Flexible(
                        child: Row(
                          children: [
                            SizedBox(
                              height: 38.0,
                              child: OutlinedButton(

                                onPressed: () {

                                },

                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  side: const BorderSide(
                                    color:  Color.fromRGBO(5, 113, 106, 0.5),
                                    width: 1.0,

                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                child: const Text(
                                  "Export",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            // Import Button
                            SizedBox(
                              height: 38,
                              child: OutlinedButton(
                                onPressed: () {

                                },
                                style: OutlinedButton.styleFrom(

                                  backgroundColor: Colors.white,
                                  side: const BorderSide(
                                    color: Color.fromRGBO(5, 113, 106, 0.5),
                                    width: 1.0,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                child: const Text(
                                  "Import",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            // Create new Button
                            SizedBox(
                              height: 38.0,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add create new logic here
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromRGBO(5, 113, 106, 1.0),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10.0,
                                    horizontal: 25.0,
                                  ),
                                  textStyle: const TextStyle(
                                    fontSize: 14.0,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                child: const Text(
                                  "Create new",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),


                  ],
                ),
                const SizedBox(height: 30.0,),
                Container(

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Color.fromRGBO(248, 249, 250, 1.0),
                              width: 2.0,
                              ),
                            )
                        ),
                        width: double.infinity,
                        child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: CustomTextField(
                                  hintText: "Search product(product name or ID)",
                                  controller: productsController.searchProductController,
                                  suffixWidget: IconButton(
                                      onPressed: productsController.onSearchProductButtonClicked,
                                      icon: const Icon(Icons.search)
                                  ),
                                ),
                              ),
                              const Spacer(),

                              Expanded(
                                flex: 1,
                                child: Obx(() => DropdownButtonFormField(
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
                                  items: productsController.categoryList
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
                              ),

                            ]
                        ),
                      ),
                      Obx(() => Container(
                        width: double.infinity,
                        height: 2000.0,
                        padding: const EdgeInsets.all(20.0),
                        child: ListView.builder(
                            itemCount: productsController.products.length,
                            itemBuilder: (context, index) {

                              int id = productsController.products.value[index]["id"];
                              String imageUrl = "${ProductApis.imagePath}2b195dae51fb1fd386410859adc9ee23.webp";
                              String name = productsController.products.value[index]["name"];
                              String beforePrice = productsController.products[index]["before_price"];
                              String currentPrice = productsController.products[index]["current_price"];
                              dynamic category = productsController.products[index]["category"];
                              String tag = productsController.products[index]["tag"];
                              print(id);
                              print(name);
                              print(beforePrice);
                              print(currentPrice);
                              print(category);
                              print(tag);
                              return Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {},
                                  child: ProductItem(
                                    imgSrc: imageUrl,
                                    productName: "Lemon",
                                    currentPrice: "1.1",
                                    beforePrice: "2.2",
                                    categoty: "fruit",
                                    tag: "22",
                                    id: 22,
                                  ),
                                ),
                              );
                            }
                        ),
                      )),


                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
