import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/repositories/product/product_repository.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;

  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading()) {
    on<LoadProduct>(_onLoadProducts);
    on<UpdateProduct>(_onUpdateProducts);
  }

  void _onLoadProducts(event, Emitter<ProductState> emit) {
    _productSubscription?.cancel();
    _productSubscription =
        _productRepository.getAllProducts().listen((products) {
      return add(UpdateProduct(products));
    });
  }

  void _onUpdateProducts(event, Emitter<ProductState> emit) {
    emit(ProductLoaded(products: event.products));
  }
}
