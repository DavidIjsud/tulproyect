

class Product{

     int id ;
     String nombre;
     String sku;
     String descripcion;
     int cantidadSolicitado;

     Product({ required this.id , required this.nombre , required this.sku , required this.descripcion , required this.cantidadSolicitado });

    Product copyWith({ 
      int? id ,
      String? nombre ,
      String? sku ,
      String? descripcion,
      int? cantidadSolicitado
       }){
      return Product(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        sku: sku ?? this.sku,
        descripcion: descripcion ?? this.descripcion,
        cantidadSolicitado: cantidadSolicitado ?? this.cantidadSolicitado,
      );
    }
     
    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        nombre: json["nombre"],
        sku: json["sku"],
        descripcion: json["descripcion"],
        cantidadSolicitado: json["cantidadSolicitado"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "sku": sku,
        "descripcion": descripcion,
        "cantidadSolicitado": cantidadSolicitado,
    };

}