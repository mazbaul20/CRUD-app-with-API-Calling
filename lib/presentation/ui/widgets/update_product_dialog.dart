import 'package:flutter/material.dart';
import 'custom_text_form_field.dart';

class UpdateProductDialog extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController codeController;
  final TextEditingController imageController;
  final TextEditingController qtyController;
  final TextEditingController unitPriceController;
  final TextEditingController totalPriceController;
  final VoidCallback onUpdatePressed;

  const UpdateProductDialog({
    super.key,
    required this.nameController,
    required this.codeController,
    required this.imageController,
    required this.qtyController,
    required this.unitPriceController,
    required this.totalPriceController,
    required this.onUpdatePressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Update Product Details"),
      content: Column(
        spacing: 12,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormField(
            controllerName: nameController,
            hintText: "Product Name",
          ),
          CustomTextFormField(
            controllerName: codeController,
            hintText: "Product Code",
          ),
          CustomTextFormField(
            controllerName: imageController,
            hintText: "Image",
          ),
          CustomTextFormField(controllerName: qtyController, hintText: "Qty"),
          CustomTextFormField(
            controllerName: unitPriceController,
            hintText: "Unit price",
          ),
          CustomTextFormField(
            controllerName: totalPriceController,
            hintText: "Total price",
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: onUpdatePressed,
              child: const Text(
                "Update Product",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
