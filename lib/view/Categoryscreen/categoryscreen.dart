import 'package:flutter/material.dart';
import 'package:newsappppppp/Dummydb.dart';
import 'package:newsappppppp/controller/categorycontroller.dart';
import 'package:newsappppppp/view/Newslist/newslist.dart';
import 'package:provider/provider.dart';


class Categoryscreen extends StatefulWidget {
  const Categoryscreen({super.key});

  @override
  State<Categoryscreen> createState() => _CategoryscreenState();
}

class _CategoryscreenState extends State<Categoryscreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CategoryController>().getCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final categories = context.watch<CategoryController>().categories;

    return Scaffold(
     appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Categories",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: GridView.builder(
          itemCount: Dummydb.catimagescts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Stack(
              children: [
                InkWell(onTap: () {

                context.read<CategoryController>().selectedCategory;
               
                Navigator.push(
                  context,
                  MaterialPageRoute(
                   builder: (context) => NewsListScreen(category: categories[index]),
                  ),
                );
                },
                  child: Container(
                    height: 150,
                    width: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(Dummydb.catimagescts[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 20,
                  child: Text(
                    Dummydb.cattextscts[index],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
        );
  
    
  }
}
