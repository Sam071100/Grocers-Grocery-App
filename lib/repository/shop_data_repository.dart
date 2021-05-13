import 'package:grocery_app_bloc_architecture/model/shop.dart';

class ShopDataProvider {
  Future<ShopData> getShopItems() async {
    List<ShopItem> shopItems = [
      ShopItem(
          imageUrl:
              "https://i0.wp.com/www.web-workers.ch/wp-content/uploads/2017/12/RedApple1.jpg?resize=400%2C400&ssl=1",
          price: 270,
          quantity: 1,
          title: 'Apples',
          thumbnail:
              'https://i0.wp.com/www.web-workers.ch/wp-content/uploads/2017/12/RedApple1.jpg?resize=400%2C400&ssl=1',
          fruits: true,
          category: "fruits"),
      ShopItem(
          imageUrl:
              "https://tse4.mm.bing.net/th/id/OIP.A1q0Tz9jM3ixmG65fMNTggHaJ1?pid=ImgDet&rs=1",
          price: 150,
          quantity: 1,
          title: 'Oranges',
          thumbnail:
              'https://tse4.mm.bing.net/th/id/OIP.A1q0Tz9jM3ixmG65fMNTggHaJ1?pid=ImgDet&rs=1',
          fruits: true,
          category: "fruits"),
      ShopItem(
          imageUrl:
              "https://freepngimg.com/thumb/kiwi/5-2-kiwi-transparent.png",
          price: 15,
          quantity: 1,
          title: 'Kiwi',
          thumbnail:
              'https://freepngimg.com/thumb/kiwi/5-2-kiwi-transparent.png',
          fruits: true,
          category: "fruits"),
      ShopItem(
          imageUrl:
              "https://th.bing.com/th/id/OIP.AWqYq6HSDjcNW02pmJfiiQHaFa?pid=ImgDet&rs=1",
          price: 90,
          quantity: 1,
          title: 'Grapes',
          thumbnail:
              'https://th.bing.com/th/id/OIP.AWqYq6HSDjcNW02pmJfiiQHaFa?pid=ImgDet&rs=1',
          fruits: true,
          category: "fruits"),
      ShopItem(
          imageUrl:
              "https://tse2.mm.bing.net/th/id/OIP.Ex3K8OwaJW3CFLHtjifh7QHaGf?pid=ImgDet&rs=1",
          price: 50,
          quantity: 1,
          title: 'Guava',
          thumbnail:
              'https://tse2.mm.bing.net/th/id/OIP.Ex3K8OwaJW3CFLHtjifh7QHaGf?pid=ImgDet&rs=1',
          fruits: true,
          category: "fruits"),
      ShopItem(
          imageUrl:
              "https://th.bing.com/th/id/OIP.Dk4iXf11uu5TcW0sdrH2dgHaE6?w=230&h=180&c=7&o=5&dpr=1.25&pid=1.7",
          price: 30,
          quantity: 1,
          title: 'Potatos',
          thumbnail:
              'https://th.bing.com/th/id/OIP.Dk4iXf11uu5TcW0sdrH2dgHaE6?w=230&h=180&c=7&o=5&dpr=1.25&pid=1.7',
          fruits: false,
          category: "vegetables"),
      ShopItem(
          imageUrl:
              "https://tse3.mm.bing.net/th/id/OIP.XzIZW4B4VQjULw7znpUazAHaGu?pid=ImgDet&rs=1",
          price: 20,
          quantity: 1,
          title: 'Onions',
          thumbnail:
              'https://tse3.mm.bing.net/th/id/OIP.XzIZW4B4VQjULw7znpUazAHaGu?pid=ImgDet&rs=1',
          fruits: false,
          category: "vegetables"),
      ShopItem(
          imageUrl:
              "https://tse1.mm.bing.net/th/id/OIP.7-dvh6lYqMtuM7hIONHDYwHaFj?pid=ImgDet&rs=1",
          price: 60,
          quantity: 1,
          title: 'Carrot',
          thumbnail:
              'https://tse1.mm.bing.net/th/id/OIP.7-dvh6lYqMtuM7hIONHDYwHaFj?pid=ImgDet&rs=1',
          fruits: false,
          category: "vegetables"),
      ShopItem(
          imageUrl:
              "https://th.bing.com/th/id/Rdb5c3009bf143c3d927c6985df8ae62f?rik=0j30x%2fta1oJUHQ&riu=http%3a%2f%2fpngimg.com%2fuploads%2fpepper%2fpepper_PNG3261.png&ehk=rDyxOu7jgfzzbVLSqqk%2fKiiiZBSQTS%2b2W5YW7bv4Tqc%3d&risl=&pid=ImgRaw",
          price: 80,
          quantity: 1,
          title: 'Capsicum',
          thumbnail:
              'https://th.bing.com/th/id/Rdb5c3009bf143c3d927c6985df8ae62f?rik=0j30x%2fta1oJUHQ&riu=http%3a%2f%2fpngimg.com%2fuploads%2fpepper%2fpepper_PNG3261.png&ehk=rDyxOu7jgfzzbVLSqqk%2fKiiiZBSQTS%2b2W5YW7bv4Tqc%3d&risl=&pid=ImgRaw',
          fruits: false,
          category: "vegetables"),
      ShopItem(
          imageUrl:
              "https://th.bing.com/th/id/R65b4544c6bacbbb97be6964f6f1f77ae?rik=5il3LoFtRhCa%2fA&riu=http%3a%2f%2fwww.freepngimg.com%2fdownload%2ftomato%2f21718-5-tomatoes-with-a-transparent-background.png&ehk=PX9WRENyYb54emLNNC47byzJN%2fxgtAeLqvXUEyazowA%3d&risl=&pid=ImgRaw",
          price: 20,
          quantity: 1,
          title: 'Tomatoes',
          thumbnail:
              'https://th.bing.com/th/id/R65b4544c6bacbbb97be6964f6f1f77ae?rik=5il3LoFtRhCa%2fA&riu=http%3a%2f%2fwww.freepngimg.com%2fdownload%2ftomato%2f21718-5-tomatoes-with-a-transparent-background.png&ehk=PX9WRENyYb54emLNNC47byzJN%2fxgtAeLqvXUEyazowA%3d&risl=&pid=ImgRaw',
          fruits: false,
          category: "vegetables"),
    ];
    return ShopData(shopitems: shopItems);
  }

  Future<ShopData> geCartItems() async {
    List<ShopItem> shopItems = []; // Initially the cart is empty
    return ShopData(shopitems: shopItems);
  }
}
