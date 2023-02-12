import 'package:flutter/material.dart';
class GridViewScreen extends StatefulWidget {
  const GridViewScreen({super.key});



  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Find Products',
        style: TextStyle(
            color: Colors.black,
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 350,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                onTap: (){},
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search Store',
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                  itemCount: 8,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemBuilder: (context, index){
                    return Product(index: index,);

                  }),
            ),

          ],
        ),
      ),
    );
  }
}

class Product extends StatelessWidget {
  Product({Key? key, required this.index}) : super(key: key);

  final int index;
  List<String> images =[
    "https://raw.githubusercontent.com/mohammedhashim44/Flutter-Grocery-App-UI/main/assets/images/categories_images/fruit.png",
    "https://raw.githubusercontent.com/mohammedhashim44/Flutter-Grocery-App-UI/main/assets/images/categories_images/fruit.png",
    "https://raw.githubusercontent.com/mohammedhashim44/Flutter-Grocery-App-UI/main/assets/images/categories_images/fruit.png",
    "https://raw.githubusercontent.com/mohammedhashim44/Flutter-Grocery-App-UI/main/assets/images/categories_images/fruit.png",
    "https://raw.githubusercontent.com/mohammedhashim44/Flutter-Grocery-App-UI/main/assets/images/categories_images/fruit.png",
    "https://raw.githubusercontent.com/mohammedhashim44/Flutter-Grocery-App-UI/main/assets/images/categories_images/fruit.png",
    "https://raw.githubusercontent.com/mohammedhashim44/Flutter-Grocery-App-UI/main/assets/images/categories_images/fruit.png",
    "https://raw.githubusercontent.com/mohammedhashim44/Flutter-Grocery-App-UI/main/assets/images/categories_images/fruit.png",
  ];
  List <String> products = [
    'Fresh fruits & vegetables',
    'Fresh fruits & vegetables',
    'Fresh fruits & vegetables',
    'Fresh fruits & vegetables',
    'Fresh fruits & vegetables',
    'Fresh fruits & vegetables',
    'Fresh fruits & vegetables',
    'Fresh fruits & vegetables',
  ];
  List <Color> productsColors =[
    Colors.green.shade200,
    Colors.orange.shade200,
    Colors.pink.shade200,
    Colors.purple.shade200,
    Colors.yellow.shade200,
    Colors.blue.shade200,
    Colors.purple.shade300,
    Colors.red.shade200,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: productsColors[index],
        borderRadius: BorderRadius.circular(20),
      ) ,
      child: Column(
        children: [
          Expanded(child: Image.network(images[index])),
          Text(products[index]),
        ],
      ),
    );
  }
}
