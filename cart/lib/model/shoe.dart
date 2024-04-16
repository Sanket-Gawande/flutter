class Shoe {
  final double price;
  final String title;
  final String desc;
  final String imagePath;

  Shoe(
      {required this.price,
      required this.title,
      required this.desc,
      required this.imagePath});
}

List<Shoe> shoesList = [
  Shoe(
      desc:
          'Comfortable running shoe with breathable mesh upper and responsive cushioning.',
      imagePath: 'assets/images/shoe1.png',
      price: 79.99,
      title: 'Nike Air Zoom Pegasus 38'),
  Shoe(
      desc:
          'Classic canvas sneaker with a timeless design and durable construction.',
      imagePath: 'assets/images/shoe2.png',
      price: 49.99,
      title: 'Converse Chuck Taylor All Star'),
  Shoe(
      desc:
          'Stylish leather shoe with a sleek silhouette and cushioned footbed for all-day comfort.',
      imagePath: 'assets/images/shoe3.png',
      price: 129.99,
      title: 'Adidas Stan Smith'),
  Shoe(
      desc:
          'Versatile hiking shoe featuring waterproof construction and rugged outsole for traction on various terrains.',
      imagePath: 'assets/images/shoe4.png',
      price: 109.99,
      title: 'Merrell Moab 2 Waterproof'),
  Shoe(
      desc:
          'Lightweight and flexible shoe designed for cross-training and gym workouts.',
      imagePath: 'assets/images/shoe5.png',
      price: 89.99,
      title: 'Reebok Nano X'),
  Shoe(
      desc:
          'Classic leather shoe with a heritage-inspired design and cushioned midsole for support.',
      imagePath: 'assets/images/shoe6.png',
      price: 69.99,
      title: 'New Balance 574'),
  Shoe(
      desc:
          'Fashionable platform sneaker with a chunky sole and padded collar for added comfort.',
      imagePath: 'assets/images/shoe7.png',
      price: 59.99,
      title: 'Fila Disruptor II'),
  Shoe(
      desc:
          'Sleek and modern running shoe with a lightweight design and responsive cushioning.',
      imagePath: 'assets/images/shoe8.png',
      price: 99.99,
      title: 'Under Armour Charged Assert 8'),
  Shoe(
      desc:
          'Durable work boot with steel toe protection and slip-resistant outsole for safety on the job.',
      imagePath: 'assets/images/shoe9.png',
      price: 149.99,
      title: 'Timberland PRO Pit Boss'),
  Shoe(
      desc:
          'Casual slip-on shoe with a relaxed fit and memory foam insole for everyday comfort.',
      imagePath: 'assets/images/shoe10.png',
      price: 39.99,
      title: 'Skechers Equalizer Persistent'),
];
