import 'package:api_alya/controllers/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MobilePage extends StatelessWidget {
  final productController = Get.put(ApiController());
  MobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
      ),
      body: Obx(() => productController.isLoading.value?Center(
        child: CircularProgressIndicator(),
      ) : ListView.builder(
        itemCount: productController.productresponsemodel.length,
        itemBuilder: (BuildContext context, int index){
          var product = productController.productresponsemodel[index];
          return Card(
            surfaceTintColor: Colors.white,
            margin: EdgeInsets.only(left: 30, right: 30, top: 20),
            elevation: 4,
            child: Container(
              margin: EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 120, // Adjust the width as needed
                    child: Image.network(
                      product.image ?? "",
                      height: 150, // Set the desired height of the image
                      fit: BoxFit.cover, // Adjust the image fit
                    ),
                  ),
                  SizedBox(width: 16), // Add spacing between image and title
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${product.title ?? ""}'),
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
