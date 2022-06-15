import 'package:e_commerce/model/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}
