import 'package:e_commerce/model/models.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getAllCategories();
}
