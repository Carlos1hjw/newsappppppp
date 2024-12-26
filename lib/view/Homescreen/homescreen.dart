import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newsappppppp/Dummydb.dart';
import 'package:newsappppppp/view/Categoryscreen/categoryscreen.dart';
import 'package:newsappppppp/view/Featurednews/featurednews.dart';
import 'package:newsappppppp/view/Latestnews/latestnewsscreen.dart';
import 'package:newsappppppp/view/Newsscreen/newsscreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {


 
  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      child: Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        title: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade50,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
            prefixIcon: const Icon(Icons.search),
            hintText: "Search",
            hintStyle: const TextStyle(color: Colors.grey),
            suffixIcon: const Icon(Icons.mic)
          ),
        ),
      ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader("Featured News", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Featurednews(),
                    ),
                  );
                }),
                const SizedBox(height: 10),
                _buildCarouselSlider(),
                const SizedBox(height: 20),
                _buildHeader("Categories", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Categoryscreen(),
                    ),
                  );
                }),
                const SizedBox(height: 10),
                _buildCategoryList(),
                const SizedBox(height: 20),
                _buildHeader("Latest News", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Latestnewsscreen(),
                    ),
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                _buildNewsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

 _buildHeader(String title, VoidCallback onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: const Text(
            "See All",
            style: TextStyle(
              color: Colors.red,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

 _buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        scrollDirection: Axis.horizontal,
      ),
      items: Dummydb.carousel.map((imagePath) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: InkWell(onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => const Newsscreen(),));
          },
            child: Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ), 
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Stack(children: [
                  Positioned(left: 5,bottom: 15,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("hi",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),maxLines: 2,overflow: TextOverflow.ellipsis,
                        ),
                        Text("Lorem Ipsum is not simply random text.",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),maxLines: 2,overflow: TextOverflow.ellipsis,
                    )
                      ],
                    ),
                    )
                ],),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

_buildCategoryList() {
    return SizedBox(
        height: 135, // Set the fixed height
        child: Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: Dummydb.catimagesh.length,
            itemBuilder: (context, index) => Stack(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => catopenscreen(text:Dummydb.cattextsh[index], imagePath: Dummydb.catimagesh[index],),));

                },
                  child: Container(
                    height: 135,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            image: AssetImage(Dummydb.catimagesh[index]),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Positioned(
                  left: 20,
                  bottom: 20,
                  child: Text(
                    Dummydb.cattextsh[index],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ))
            ]),
          ),
        ));
  }

_buildNewsList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: Dummydb.news.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Stack(
            children: [
              InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Newsscreen(),));
              },
                child: Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(Dummydb.news[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 10,
                bottom: 10,
                child:  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("hello",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),maxLines: 2,
                      ),
                      Text("Lorem Ipsum is not simply random text.",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),maxLines: 2,overflow: TextOverflow.ellipsis,
                  )
                    ],
                  ),
              ),
            ],
          ),
        );
      },
    );
  }

  catopenscreen({required String text, required String imagePath}) {

    return DefaultTabController(
    length: 2,
    child: Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              leading: const BackButton(color: Colors.white,),
              expandedHeight: 200, 
              pinned: true, 
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      imagePath, 
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.4),
                            Colors.transparent
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                ),
                title:  Text(
                  text,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: Dummydb.news.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Stack(
                  children: [
                    Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(Dummydb.news[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 10,
                      bottom: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Contrary to popular belief, ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                            maxLines: 2,
                          ),
                          Text(
                            "Lorem Ipsum is not simply random text.",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                            maxLines: 2,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    ),
  );
  }
}




