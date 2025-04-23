class ProductsResponse {
  final List<ProductResponse> products;

  ProductsResponse({required this.products});


  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    List<ProductResponse> productList = [];
    json.forEach((key, value) {
      productList.add(ProductResponse(id: key, name: value));
    });
    return ProductsResponse(products: productList);
  }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    for (var product in products) {
      json[product.id] = product.name;
    }
    return json;
  }
}

class ProductResponse {
  final String id;
  final String name;

  ProductResponse({required this.id, required this.name});


  factory ProductResponse.fromJson(String id, String name) {
    return ProductResponse(id: id, name: name);
  }

 
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
