import 'package:api_cubit/src/cubit/category/category_repository.dart';
import 'package:api_cubit/src/models/api_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:api_cubit/src/models/category_model.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  final CategoryRepository _repository = CategoryRepository();

  getAllCategories() async {
    emit(CategoryLoading());
    try {
      ApiResponseModel response = await _repository.getAllCategory();
      if (response.status) {
        List<CategoryModel> categoryList = response.data
            .map<CategoryModel>((e) => CategoryModel.fromJSON(e))
            .toList();
        emit(CategoryLoadSucess(categoryList));
      } else {
        String errorMessage = response.error!;
        emit(CategoryLoadError(errorMessage));
      }
    } catch (ex) {
      emit(CategoryLoadError("error loading data"));
    }
  }

  addCategory(CategoryModel categoryModel) async {
    emit(CategoryLoading());

    try {
      ApiResponseModel response = await _repository.addCategory(categoryModel);
      if (response.status) {
        CategoryModel categoryModel = CategoryModel.fromJSON(response.data);
        emit(CategoryCreationSuccess(categoryModel));
      } else {
        emit(CategoryCreationError(response.error!));
      }
    } catch (ex) {
      emit(const CategoryCreationError("something went wrong"));
    }
    await Future.delayed(Duration(seconds: 2));
    getAllCategories();
  }

  getCategoryById(CategoryModel categoryModel) async {
    emit(CategoryLoading());

    try {
      ApiResponseModel response =
      await _repository.getCategoryById(categoryModel);
      if (response.status) {
        CategoryModel categoryModel = CategoryModel.fromJSON(response.data);
        emit(CategoryByIdLoadSuccess(categoryModel));
      } else {
        emit(CategoryByIdLoadError(response.error!));
      }
    } catch (ex) {
      emit(const CategoryByIdLoadError("something went wrong"));
    }
  }

  deleteCategory(CategoryModel categoryModel) async {
    emit(CategoryLoading());

    try {
      ApiResponseModel response =
      await _repository.deleteCategoryById(categoryModel);
      if (response.status) {
        emit(CategoryDeleteSuccess());
      } else {
        emit(CategoryDeleteError(response.error!));
      }
    } catch (ex) {
      emit(const CategoryDeleteError("something went wrong"));
    }
    await Future.delayed(Duration(seconds: 2));
    getAllCategories();
  }

  updateCategory(CategoryModel categoryModel) async {
    emit(CategoryLoading());

    try {
      ApiResponseModel response =
      await _repository.updateCategoryById(categoryModel);
      if (response.status) {
        CategoryModel categoryModel = CategoryModel.fromJSON(response.data);
        emit(CategoryUpdateSuccess(categoryModel));
      } else {
        emit(CategoryUpdateError(response.error!));
      }
    } catch (ex) {
      emit(const CategoryUpdateError("something went wrong"));
    }
    await Future.delayed(Duration(seconds: 2));
    getAllCategories();
  }
}