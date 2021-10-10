part of 'addnewprooduct_bloc.dart';

@immutable
abstract class BaseEvents {}

class AddNewProductEvent extends BaseEvents {

    final int id;
    final String nombre;
    final String sku;
    final String descripcion;

    AddNewProductEvent({ 
      required this.id,
      required  this.nombre,
      required this.sku,
      required this.descripcion
    });         

}
