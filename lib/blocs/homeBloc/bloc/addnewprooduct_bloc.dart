import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:tul_proyect/models/cart.dart';
import 'package:tul_proyect/models/productCart.dart';
import 'package:tul_proyect/models/products.dart';

part 'addnewprooduct_event.dart';
part 'addnewprooduct_state.dart';

class AddnewprooductBloc extends Bloc<BaseEvents, NewProductState> {
 
  AddnewprooductBloc() : super(NewProductState( productCart :  new ProductCart(productsSelected: [], cart: new Cart(id: 0, status: 'pending')  ) )) {
    on<BaseEvents>((event, emit) {
              
           if( event is AddNewProductEvent ){
             
              emit(  state.copyWith(
                   productCart: state.productCart.copyWith(
                       productsSelected: newProducts( state.productCart.productsSelected , event)
                   )
               ) );

           }

    });

  }

    @override
    onTransition( Transition<BaseEvents, NewProductState> transition ){
         super.onTransition(transition);

        CollectionReference carts = FirebaseFirestore.instance.collection('carts');
        CollectionReference productCart = FirebaseFirestore.instance.collection('Product_carts');
        
        if(  transition.event is AddNewProductEvent ){

            carts.where('id',  isEqualTo: 0 )
            .get().then((value) {
                if(  value.docs.length == 0 ){
                  carts.add( transition.nextState.productCart.cart.toJson() );
                }
            });

            productCart.where(  'cart.id' ,  isEqualTo:  0    )
                  .get().then((value) {
                      if( value.docs.length == 0 ){
                        print("Nuevo");
                        productCart.add( transition.nextState.productCart.toJson() );
                      }else{
                         productCart.doc( value.docs.first.id ).update( transition.nextState.productCart.toJson() );
                      }
                  });          

        }

    }

    


  List<Product> newProducts(  List<Product> beforeListState , AddNewProductEvent event  ){

        if( beforeListState.length == 0 ){
           Product newProduct = new Product( 
             id: event.id  ,
             nombre: event.nombre  ,
             sku:  event.sku  ,
             descripcion:  event.descripcion , 
             cantidadSolicitado: 1
          );

          beforeListState.add( newProduct );
          print("Cero");
          return beforeListState;
        }

        for (var product in beforeListState) {
              if( product.id == event.id ){
                product.cantidadSolicitado = product.cantidadSolicitado + 1;
                return beforeListState;
              }
              print("No encontrado");
         }

         Product newProduct = new Product( 
             id: event.id  ,
             nombre: event.nombre  ,
             sku:  event.sku  ,
             descripcion:  event.descripcion , 
             cantidadSolicitado: 1
          );

          beforeListState.add( newProduct );
          print("No encontrado en la lista");
          return beforeListState;
        
  }

}
