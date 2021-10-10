

class Cart{

    final int id ;
    final String status;

    Cart({ required this.id, required this.status});

    Cart copyWith({int? id, String? status}){
      return Cart(
        id: id ?? this.id,
        status: status ?? this.status,
      );
    }

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
    };

}