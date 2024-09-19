// details_page.dart

import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:providerpractice/ProductsListPage/pageview.dart';
import 'package:providerpractice/VideoSreen/Provider/providerProduct.dart';
import 'package:providerpractice/VideoSreen/favoritepage1.dart';
import 'package:providerpractice/authentication/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:providerpractice/authentication/features/user_auth/presentation/pages/login_page.dart';
import 'package:providerpractice/authentication/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:providerpractice/authentication/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class DetailsPage extends StatefulWidget {
  final Map<String, dynamic> itemDetails;

  const DetailsPage({super.key, required this.itemDetails});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final bool _isSigning = false;

  final FirebaseAuthService _auth = FirebaseAuthService();

  bool _isToggled = false;
  final bool _isUpload = true;

  Future<void> deleteItem(BuildContext context, String itemId) async {
    try {
      // Fetch the item details using itemId to verify before deletion
      final response = await http.get(
        Uri.parse('https://retoolapi.dev/pDrQ2s/data/$itemId'),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );

      if (response.statusCode == 200) {
        var itemDetails = json.decode(response.body);

        // Check if the fetched item's 'Image' matches the current item's 'Image'
        if (itemDetails['Image'] == widget.itemDetails['Image']) {
          // Perform the deletion if the image matches
          final deleteResponse = await http.delete(
            Uri.parse('https://retoolapi.dev/pDrQ2s/data/$itemId'),
          );

          if (deleteResponse.statusCode == 200) {
            // Handle successful deletion
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Item deleted successfully'),
                duration: Duration(seconds: 2),
              ),
            );
            // Refresh the UI after deletion
            _refresh();
          } else {
            // Handle API error during deletion
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Failed to delete item. Please try again.'),
                duration: Duration(seconds: 2),
              ),
            );
          }
        } else {
          // Show message indicating the item was not found or does not match
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Item not found for deletion.'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } else {
        // Handle API error when fetching item details
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to fetch item details. Please try again.'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      // Handle general error (e.g., network error)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  void _refresh() {
    // Implement UI refresh logic here if needed after deletion
  }

  Future<void> deleteItem8(BuildContext context, String itemId) async {
    try {
      final response = await http.delete(
        Uri.parse('https://retoolapi.dev/pDrQ2s/data/$itemId'),
      );

      if (response.statusCode == 200) {
        // Handle successful deletion (e.g., show a snackbar)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Item deleted successfully'),
            duration: Duration(seconds: 2),
          ),
        );
        // Refresh the UI after deletion
        _refresh();
      } else {
        // Handle API error (e.g., show a snackbar)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to delete item. Please try again.'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      // Handle general error (e.g., network error)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  void _toggle() {
    setState(() {
      _isToggled = !_isToggled;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Favoriteprovider>(context);
    final word = widget.itemDetails;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavoritePage()));
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: Stack(
                    children: [
                      Center(
                        child: Image.network(
                          widget.itemDetails['Image'] ?? '',
                          height: 400,
                          width: 300,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.itemDetails['title'] ?? '',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '₹${widget.itemDetails['price'] ?? '.'}',
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.itemDetails['title2'] ?? '',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'review',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // Container(
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //     children: [
                      //       Container(
                      //         height: 150,
                      //         width: 150,
                      //         color: Colors.amber,
                      //       ),
                      //       SizedBox(
                      //         height: 10,
                      //       ),
                      //       Container(
                      //         height: 150,
                      //         width: 150,
                      //         color: Colors.amber,
                      //       )
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('aswini jewlerys garanty '),
                      )
                    ],
                  ),
                ),

                // Text(
                //   '\₹${itemDetails['price'] ?? '.'}',
                //   style: TextStyle(
                //       color: Colors.black,
                //       fontSize: 30.0,
                //       fontWeight: FontWeight.w500),
                // ),
                // SizedBox(height: 8.0),
                // Text(
                //   itemDetails['title'] ?? '',
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 30.0,
                //   ),
                // ),
                // SizedBox(height: 30.0),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                //   child: Text(
                //     'Description',
                //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(50.0),
                //   child: Text(
                //     itemDetails['title2'] ?? '',
                //     style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 20.0,
                //     ),
                //   ),
                // ),
                // SizedBox(height: 30.0),
                // ElevatedButton(
                //   onPressed: () {
                //     // Handle the "Buy" button click
                //     launch(itemDetails['buyUrl'] ?? '');
                //   },
                //   child: Text(
                //     'Buy',
                //     style: TextStyle(color: Colors.white, fontSize: 20.0),
                //   ),
                // ),
                // SizedBox(height: 30.0),
                // // Add more details as neededr
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                _launchURL();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart,
                          ),
                          Text(
                            ' Order Now',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width / 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amber),
                child: IconButton(
                  onPressed: () async {
                    _toggle();
                    if (_isUpload) {
                      if (FirebaseAuth.instance.currentUser != null) {
                        await _uploadProfile(context);
                      } else {
                        //showModalBottomSheet()
                        // _showAlertDialog(context);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //
                        //      builder: (context) => LoginPage()));
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: 800,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Image.asset('assets/profilepic.png'),
                                        // Text(
                                        //   "Login",
                                        //   style: TextStyle(
                                        //       fontSize: 27,
                                        //       fontWeight: FontWeight.bold),
                                        // ),
                                        // SizedBox(
                                        //   height: 30,
                                        // ),
                                        FormContainerWidget(
                                          controller: _emailController,
                                          hintText: "Email",
                                          isPasswordField: false,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        FormContainerWidget(
                                          controller: _passwordController,
                                          hintText: "Password",
                                          isPasswordField: true,
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        GestureDetector(
                                          onTap: _signIn,
                                          child: Container(
                                            width: double.infinity,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: const Center(
                                                child: Text(
                                              "Login",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                                "Don't have an account?"),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  showModalBottomSheet(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return Center(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        15),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                const Text(
                                                                  "Sign Up",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          27,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                const SizedBox(
                                                                  height: 30,
                                                                ),
                                                                FormContainerWidget(
                                                                  controller:
                                                                      _usernameController,
                                                                  hintText:
                                                                      "Username",
                                                                  isPasswordField:
                                                                      false,
                                                                ),
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                FormContainerWidget(
                                                                  controller:
                                                                      _emailController,
                                                                  hintText:
                                                                      "Email",
                                                                  isPasswordField:
                                                                      false,
                                                                ),
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                FormContainerWidget(
                                                                  controller:
                                                                      _passwordController,
                                                                  hintText:
                                                                      "Password",
                                                                  isPasswordField:
                                                                      true,
                                                                ),
                                                                const SizedBox(
                                                                  height: 30,
                                                                ),
                                                                GestureDetector(
                                                                  onTap:
                                                                      _signUp,
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: 45,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .blue,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    child: const Center(
                                                                        child: Text(
                                                                      "Sign Up",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    )),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 20,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    const Text(
                                                                        "Already have an account?"),
                                                                    const SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          Navigator.pushAndRemoveUntil(
                                                                              context,
                                                                              MaterialPageRoute(builder: (context) => const LoginPage()),
                                                                              (route) => false);
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "Login",
                                                                          style: TextStyle(
                                                                              color: Colors.blue,
                                                                              fontWeight: FontWeight.bold),
                                                                        ))
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                  // Navigator.pushAndRemoveUntil(
                                                  //     context,
                                                  //     MaterialPageRoute(
                                                  //         builder: (context) =>
                                                  //             SignUpPage()),
                                                  //     (route) => false);
                                                },
                                                child: const Text(
                                                  "Sign Up",
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                    } else {
                      // Replace with logic to get itemId dynamically
                      String itemId = 'id';
                      await deleteItem(context, itemId);
                    }
                  },
                  icon: Icon(
                    _isToggled ? Icons.favorite : Icons.favorite_border,
                    color: _isToggled ? Colors.red : Colors.grey,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      print("User is successfully signedIn");
      //Navigator.pushNamed(context, "/");
      Navigator.pop(context);
    } else {
      print("Some error happend");
    }
  }

  _signUp() async {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
      print("User is successfully created");
      Navigator.pop(context);
    } else {
      print("Some error happend");
    }
  }

  Future<void> _uploadProfile(BuildContext context) async {
    String productUrlimage = widget.itemDetails['Image'] ?? '';
    String productUrlprice = widget.itemDetails['price'] ?? '';
    String productUrltitle = widget.itemDetails['title'] ?? '';
    String productUrlurld = widget.itemDetails['title2'] ?? '';
    String productUrlurl = widget.itemDetails['url'] ?? '';
    String currentUserEmail = FirebaseAuth.instance.currentUser?.email ?? '';

    // Check if the item with the same image URL already exists
    bool isAlreadyPosted = false;

    // Replace with your logic to check if the item already exists in API
    try {
      var response = await http.get(
        Uri.parse('https://retoolapi.dev/pDrQ2s/data'),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        for (var item in jsonData) {
          if (item['Image'] == productUrlimage &&
              item['user_id'] == currentUserEmail) {
            isAlreadyPosted = true;
            break;
          }
        }
      } else {
        // throw Exception('Failed to load data from API');
      }
    } catch (e) {
      print('Error: $e');
    }

    if (isAlreadyPosted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Item already posted.'),
          duration: Duration(seconds: 2),
        ),
      );

      return; // Exit function if item is already posted
    }

    // Perform the API POST request to add the item
    try {
      var response = await http.post(
        Uri.parse('https://retoolapi.dev/pDrQ2s/data'),
        body: {
          'Image': productUrlimage,
          'price': productUrlprice,
          'title': productUrltitle,
          'title2': productUrlurld,
          'buyUrl': productUrlurl,
          'user_id': currentUserEmail,
        },
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Item added successfully.'),
            duration: Duration(seconds: 2),
          ),
        );
        // Update local data or UI as needed
      } else {
        //throw Exception('Failed to add item.');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}

class _refresh {}

_launchURL() async {
  const url = 'https://wa.link/p8q78b';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void _showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('AlertDialog Title'),
        content: const Text('This is an alert dialog.'),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
          ),
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              // Perform further actions if needed
            },
          ),
        ],
      );
    },
  );
}
