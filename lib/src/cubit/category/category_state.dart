part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryInitial extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoading extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoadSucess extends CategoryState {
  final List<CategoryModel> categoryList;

  CategoryLoadSucess(this.categoryList);

  @override
  List<Object> get props => [categoryList];
}

class CategoryLoadError extends CategoryState {
  final String errorMessage;

  CategoryLoadError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class CategoryByIdLoadSuccess extends CategoryState {
  final CategoryModel categoryModel;

  @override
  List<Object> get props => [categoryModel];

  CategoryByIdLoadSuccess(this.categoryModel);
}

class CategoryByIdLoadError extends CategoryState {
  final String errorMessage;

  const CategoryByIdLoadError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class CategoryCreationSuccess extends CategoryState {
  final CategoryModel categoryModel;

  const CategoryCreationSuccess(this.categoryModel);

  @override
  List<Object> get props => [categoryModel];
}

class CategoryCreationError extends CategoryState {
  final String errorMessage;

  const CategoryCreationError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class CategoryUpdateSuccess extends CategoryState {
  CategoryModel categoryModel;

  CategoryUpdateSuccess(this.categoryModel);
  @override
  List<Object> get props => [categoryModel];
}

class CategoryUpdateError extends CategoryState {
  final String errorMessage;

  const CategoryUpdateError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

class CategoryDeleteSuccess extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryDeleteError extends CategoryState {
  final String errorMessage;

  const CategoryDeleteError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}