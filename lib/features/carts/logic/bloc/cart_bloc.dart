import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:chic_lyne/core/error/failures.dart';
import 'package:chic_lyne/core/usecases/usecase.dart';
import 'package:chic_lyne/features/carts/domain/entities/cart.dart';
import 'package:chic_lyne/features/carts/domain/usecases/add_cart_use_case.dart';
import 'package:chic_lyne/features/carts/domain/usecases/add_product_to_cart_use_case.dart';
import 'package:chic_lyne/features/carts/domain/usecases/clear_cart_use_case.dart';
import 'package:chic_lyne/features/carts/domain/usecases/decrement_product_quantity_use_case.dart';
import 'package:chic_lyne/features/carts/domain/usecases/delete_cart_use_case.dart';
import 'package:chic_lyne/features/carts/domain/usecases/get_all_carts.dart';
import 'package:chic_lyne/features/carts/domain/usecases/get_cart_by_id_use_case.dart';
import 'package:chic_lyne/features/carts/domain/usecases/get_cart_by_user_use_case.dart';
import 'package:chic_lyne/features/carts/domain/usecases/increment_product_quantity_use_case.dart';
import 'package:chic_lyne/features/carts/domain/usecases/remove_product_from_cart_use_case.dart';
import 'package:chic_lyne/features/carts/domain/usecases/update_cart_use_case.dart';
import 'package:equatable/equatable.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetAllCarts getAllCarts;
  final GetCartById getCartById;
  final GetCartByUser getCartByUser;
  final AddCart addCart;
  final UpdateCart updateCart;
  final DeleteCart deleteCart;
  final AddProductToCart addProductToCart;
  final RemoveProductFromCart removeProductFromCart;
  final IncrementProductQuantity incrementProductQuantity;
  final DecrementProductQuantity decrementProductQuantity;
  final ClearCart clearCart;

  CartBloc({
    required this.getAllCarts,
    required this.getCartById,
    required this.getCartByUser,
    required this.addCart,
    required this.updateCart,
    required this.deleteCart,
    required this.addProductToCart,
    required this.removeProductFromCart,
    required this.incrementProductQuantity,
    required this.decrementProductQuantity,
    required this.clearCart,
  }) : super(CartInitial()) {
    on<GetAllCartsEvent>(_onGetAllCarts);
    on<GetCartByIdEvent>(_onGetCartById);
    on<GetCartByUserEvent>(_onGetCartByUser);
    on<AddCartEvent>(_onAddCart);
    on<UpdateCartEvent>(_onUpdateCart);
    on<DeleteCartEvent>(_onDeleteCart);
    on<AddProductToCartEvent>(_onAddProductToCart);
    on<RemoveProductFromCartEvent>(_onRemoveProductFromCart);
    on<IncrementProductQuantityEvent>(_onIncrementProductQuantity);
    on<DecrementProductQuantityEvent>(_onDecrementProductQuantity);
    on<ClearCartEvent>(_onClearCart);
  }

  Future<void> _onGetAllCarts(
    GetAllCartsEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    final result = await getAllCarts(NoParams());
    result.fold(
      (failure) => emit(CartError(_mapFailureToMessage(failure))),
      (carts) => emit(AllCartsLoaded(carts)),
    );
  }

  Future<void> _onGetCartById(
    GetCartByIdEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    final result = await getCartById(CartIdParams(cartId: event.cartId));
    result.fold(
      (failure) => emit(CartError(_mapFailureToMessage(failure))),
      (cart) => emit(CartLoaded(cart)),
    );
  }

  Future<void> _onGetCartByUser(
    GetCartByUserEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    final result = await getCartByUser(UserIdParams(userId: event.userId));
    result.fold(
      (failure) => emit(CartError(_mapFailureToMessage(failure))),
      (cart) => emit(CartLoaded(cart)),
    );
  }

  Future<void> _onAddCart(
    AddCartEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    final result = await addCart(CartDataParams(cartData: event.cartData));
    result.fold(
      (failure) => emit(CartError(_mapFailureToMessage(failure))),
      (cart) => emit(CartAdded(cart)),
    );
  }

  Future<void> _onUpdateCart(
    UpdateCartEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    final result = await updateCart(UpdateCartParams(
      cartId: event.cartId,
      updateData: event.updateData,
    ));
    result.fold(
      (failure) => emit(CartError(_mapFailureToMessage(failure))),
      (cart) => emit(CartUpdated(cart)),
    );
  }

  Future<void> _onDeleteCart(
    DeleteCartEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    final result = await deleteCart(CartIdParams(cartId: event.cartId));
    result.fold(
      (failure) => emit(CartError(_mapFailureToMessage(failure))),
      (_) => emit(CartDeleted()),
    );
  }

  Future<void> _onAddProductToCart(
    AddProductToCartEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    final result = await addProductToCart(AddProductParams(
      cartId: event.cartId,
      product: event.product,
    ));
    result.fold(
      (failure) => emit(CartError(_mapFailureToMessage(failure))),
      (cart) => emit(ProductAddedToCart(cart)),
    );
  }

  Future<void> _onRemoveProductFromCart(
    RemoveProductFromCartEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    final result = await removeProductFromCart(CartProductParams(
      cartId: event.cartId,
      productId: event.productId,
    ));
    result.fold(
      (failure) => emit(CartError(_mapFailureToMessage(failure))),
      (cart) => emit(ProductRemovedFromCart(cart)),
    );
  }

  Future<void> _onIncrementProductQuantity(
    IncrementProductQuantityEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    final result = await incrementProductQuantity(CartProductParams(
      cartId: event.cartId,
      productId: event.productId,
    ));
    result.fold(
      (failure) => emit(CartError(_mapFailureToMessage(failure))),
      (cart) => emit(ProductQuantityIncremented(cart)),
    );
  }

  Future<void> _onDecrementProductQuantity(
    DecrementProductQuantityEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    final result = await decrementProductQuantity(CartProductParams(
      cartId: event.cartId,
      productId: event.productId,
    ));
    result.fold(
      (failure) => emit(CartError(_mapFailureToMessage(failure))),
      (cart) => emit(ProductQuantityDecremented(cart)),
    );
  }

  Future<void> _onClearCart(
    ClearCartEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    final result = await clearCart(CartIdParams(cartId: event.cartId));
    result.fold(
      (failure) => emit(CartError(_mapFailureToMessage(failure))),
      (cart) => emit(CartCleared(cart)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return failure.message;
      case NetworkFailure:
        return failure.message;
      default:
        return 'Unexpected error';
    }
  }
}