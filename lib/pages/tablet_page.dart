import 'package:api_alya/controllers/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class TabletPage extends StatelessWidget {
  final productController = Get.put(ApiController());
  TabletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
      ),
      body: Obx(() => productController.isLoading.value
          ? Center(
        child: CircularProgressIndicator(),
      )
          : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: productController.productresponsemodel.length,
        itemBuilder: (BuildContext context, int index) {
          var product = productController.productresponsemodel[index];
          return Card(
            surfaceTintColor: Colors.white,
            margin: EdgeInsets.only(left: 30, right: 30, top: 20),
            elevation: 4,
            child: Container(
              margin: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 140, // Adjust the width as needed
                    child: Image.network(
                      product.image ?? "",
                      height: 140, // Set the desired height of the image
                      fit: BoxFit.fill, // Adjust the image fit
                    ),
                  ),
                  SizedBox(width: 16, height: 5,), // Add spacing between image and title
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${product.title ?? ""}', overflow: TextOverflow.ellipsis,),
                        // Add other details if needed
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
