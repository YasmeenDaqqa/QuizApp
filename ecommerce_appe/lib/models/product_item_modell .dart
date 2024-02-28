enum ProductSize {
  S,
  M,
  L,
  XL,
}

class ProductItemModell {
  final String id;
  final String name;
  final String imgUrl;
  final String description;
  final double price;
  final String category;
  final ProductSize? size;
  final double averageRate;

  ProductItemModell({
    required this.id,
    required this.name,
    required this.imgUrl,
    this.size,
    this.description =
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    required this.price,
    required this.category,
    this.averageRate = 4.5,
  });

  ProductItemModell copyWith({
    String? id,
    String? name,
    String? imgUrl,
    String? description,
    double? price,
    String? category,
    double? averageRate,
    int? quantity,
    ProductSize? size,
  }) {
    return ProductItemModell(
      id: id ?? this.id,
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
      description: description ?? this.description,
      price: price ?? this.price,
      category: category ?? this.category,
      averageRate: averageRate ?? this.averageRate,
      size: size ?? this.size,
    );
  }
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'imgUrl': imgUrl});
    result.addAll({'description': description});
    result.addAll({'price': price});
    result.addAll({'category': category});
    result.addAll({'averageRate': averageRate});

    return result;
  }

  factory ProductItemModell.fromMap(
      Map<String, dynamic> map, String documentId) {
    return ProductItemModell(
      id: documentId,
      name: map['name'] ?? '',
      imgUrl: map['imgUrl'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      category: map['category'] ?? '',
      averageRate: map['averageRate']?.toDouble() ?? 0.0,
    );
  }
}

List<ProductItemModell> dummyProductss = [
//  ProductItemModell(
 //   id: '1',
  //  name: 'T-shirt',
  //  imgUrl:
   //     'https://www.highsnobiety.com/static-assets/dato/1682635705-how-to-care-for-clothes-02.jpg',
  //  price: 10,
   // category: 'Clothes',
  //),
  ProductItemModell(
    id: 'KfS3aZkyuYL4KN0W0kbK',
    name: 'Black Shoes',
    imgUrl: 'https://www.cato.org/sites/cato.org/files/styles/aside_3x/public/2023-11/fast-fashion2.jpeg?itok=72ek8bxI',
    price: 20,
    category: 'Clothes',
  ),
  ProductItemModell(
    id: 'Hl0nqohtoL5QWeo0mJvD',
    name: 'Trousers',
    imgUrl:
        'https://www.thespruce.com/thmb/zgCEkzj4shXVo4G_20yzPplwU_I=/6558x0/filters:no_upscale():max_bytes(150000):strip_icc()/wash-new-clothes-before-wearing-2146345-03-999483b3d51a435ba53c8d9ef5c2d5c4.jpg',
    price: 30,
    category: 'Clothes',
  ),
  ProductItemModell(
    id: '8mik15Oc46fL8wTQkUye',
    name: 'Pack of Tomatoes',
    imgUrl:
        'https://hips.hearstapps.com/hmg-prod/images/andreea-pop-bzybqc-zzwq-unsplash-1612908651.jpg?crop=0.518xw:0.776xh;0.220xw,0.173xh&resize=640:*',
    price: 10,
    category: 'Clothes',
  ),
  ProductItemModell(
    id: 'WeXG9831BPdRygr3ideJ',
    name: 'Pack of Potatoes',
    imgUrl: 'https://pngimg.com/d/potato_png2398.png',
    price: 10,
    category: 'Groceries',
  ),
  ProductItemModell(
    id: 'bC2rAILwMvwh6Ra2IQaA',
    name: 'Pack of Onions',
    imgUrl: 'https://pngimg.com/d/onion_PNG99213.png',
    price: 10,
    category: 'Groceries',
  ),
  ProductItemModell(
    id: 'AiojC1Y6YwHRZ0TT5Nk8',
    name: 'Pack of Apples',
    imgUrl: 'https://pngfre.com/wp-content/uploads/apple-43-1024x1015.png',
    price: 10,
    category: 'Fruits',
  ),
  ProductItemModell(
    id: 'cocRUXvSygZ0FgzRmoIB',
    name: 'Pack of Oranges',
    imgUrl:
        'https://parspng.com/wp-content/uploads/2022/05/orangepng.parspng.com_-1.png',
    price: 10,
    category: 'Fruits',
  ),
  ProductItemModell(
    id: 'gI5DMu5onAiHlUi91hGs',
    name: 'Pack of Bananas',
    imgUrl:
        'https://static.vecteezy.com/system/resources/previews/015/100/096/original/bananas-transparent-background-free-png.png',
    price: 10,
    category: 'Fruits',
  ),
  ProductItemModell(
    id: 'rPFC4t4vGTxmSkeyOcEO',
    name: 'Pack of Mangoes',
    imgUrl: 'https://purepng.com/public/uploads/large/mango-tgy.png',
    price: 10,
    category: 'Fruits',
  ),
  ProductItemModell(
    id: 'ryww3lEogRxuQoc0mTRv',
    name: 'Sweet Shirt',
    imgUrl:
        'https://www.usherbrand.com/cdn/shop/products/5uYjJeWpde9urtZyWKwFK4GHS6S3thwKRuYaMRph7bBDyqSZwZ_87x1mq24b2e7_1800x1800.png',
    price: 15,
    category: 'Clothes',
  ),
];
