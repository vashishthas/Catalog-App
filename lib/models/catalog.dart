class Item{
  final int id;
  final String name;
  final String des;
  final num price;
  final String color;
  final String imageUrl;

  Item({this.id, this.name, this.des, this.price, this.color, this.imageUrl});
}
class CatalogModel{
  static final items= [
  Item(
    id: 1, 
    name: "iphone12", 
    des: "Apple iPhone 12th generation", 
    price: 999, 
    color: "#33505a", 
    imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc"
  )
];
}