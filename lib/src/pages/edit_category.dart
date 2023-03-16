import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_cubit/src/cubit/category/category_cubit.dart';
import 'package:api_cubit/src/models/category_model.dart';
import 'package:api_cubit/src/widgets/app_button.dart';
import 'package:api_cubit/src/widgets/app_loader.dart';

class EditCategory extends StatefulWidget {
  final CategoryModel categoryModel;

  const EditCategory({required this.categoryModel});

  @override
  State<EditCategory> createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {
  TextEditingController _categoryCodeController = TextEditingController();
  TextEditingController _categoryNameController = TextEditingController();

  void initState() {
    _categoryNameController =
        TextEditingController(text: widget.categoryModel.categoryName);
    _categoryCodeController =
        TextEditingController(text: widget.categoryModel.categoryCode);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Category"),
        ),
        body: SafeArea(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _categoryNameController,
                    decoration: InputDecoration(
                        labelText: "Category Name",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(5))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _categoryCodeController,
                    decoration: InputDecoration(
                        labelText: "Category Code",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(5))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  BlocConsumer<CategoryCubit, CategoryState>(
                    listener: (context, state) {
                      if (state is CategoryCreationSuccess) {
                        Navigator.pop(context);
                      } else if (state is CategoryCreationError) {
                        Text("error message");
                      }
                    },
                    builder: (context, state) {
                      if (state is CategoryLoading) {
                        return AppLoader();
                      }
                      return AppButton(
                          buttonName: "Update Category",
                          onTap: () {
                            String categoryCode =
                            _categoryCodeController.text.trim();
                            String categoryName =
                            _categoryNameController.text.trim();
                            widget.categoryModel.categoryName = categoryName;
                            widget.categoryModel.categoryCode = categoryCode;

                            context
                                .read<CategoryCubit>()
                                .updateCategory(widget.categoryModel);
                          });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}