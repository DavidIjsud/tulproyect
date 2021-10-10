import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tul_proyect/models/cart.dart';
import 'package:tul_proyect/models/productCart.dart';

part 'addnewprooduct_event.dart';
part 'addnewprooduct_state.dart';

class AddnewprooductBloc extends Bloc<BaseEvents, AddnewprooductState> {
  AddnewprooductBloc() : super(AddnewprooductInitial( productCart :  new ProductCart(productsSelected: [], cart: new Cart(id: 0, status: 'pending')  ) )) {
    on<BaseEvents>((event, emit) {
              
    });
  }
}
