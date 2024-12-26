import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:newsappppppp/view/Categoryscreen/categoryscreen.dart';
import 'package:newsappppppp/view/Homescreen/homescreen.dart';
import 'package:newsappppppp/view/Profile/Profilescreen.dart';

class Bottomnavbarscreen extends StatefulWidget {
  const Bottomnavbarscreen({super.key});

  @override
  State<Bottomnavbarscreen> createState() => _BottomnavbarscreenState();
}

class _BottomnavbarscreenState extends State<Bottomnavbarscreen> {
  final List<Widget> bottomNavScreens = [
    const Homescreen(),
    const Categoryscreen(),
    const Profilescreen(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomNavScreens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.red,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
           BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Categoryscreen(),));
              },
              child: const Icon(Icons.category_outlined)),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
                onTap: () {
                  _showBottomSheet();
                },
                child: const Icon(Icons.person_2_outlined)),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 1.0,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const Bottomnavbarscreen(),
                              ));
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                        )),
                  ],
                ),
                const Text(
                  "WELCOME",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Welcome to the News App ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade50,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    prefixIcon: const Icon(Icons.mail_outlined),
                    hintText: "Email/Username",
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade50,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: const Icon(Icons.lock_outline),
                      hintText: "Password",
                      hintStyle: const TextStyle(color: Colors.grey),
                      suffixIcon: const Icon(Icons.remove_red_eye)),
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Icon(Icons.check_box_outline_blank),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Remember me",
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      ),
                      Spacer(),
                      Text(
                        "Forgot Password",
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.red.shade900,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(35))),
                    child: const Center(
                        child: Text(
                      "Sign in",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "or",
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Sign in with",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 65,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(FontAwesomeIcons.google),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Google",
                        style: TextStyle(
                            fontSize: 20, color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 65,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(FontAwesomeIcons.phone),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Phone Number",
                        style: TextStyle(
                            fontSize: 20, color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
