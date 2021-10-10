

class Product{

    final int id ;
    final String nombre;
    final String sku;
    final String descripcion;

     Product({ required this.id , required this.nombre , required this.sku , required this.descripcion });

    Product copyWith({ 
      int? id ,
      String? nombre ,
      String? sku ,
      String? descripcion
       }){
      return Product(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        sku: sku ?? this.sku,
        descripcion: descripcion ?? this.descripcion,
      );
    }
     
    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        nombre: json["nombre"],
        sku: json["sku"],
        descripcion: json["descripcion"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "sku": sku,
        "descripcion": descripcion,
    };

}