import 'package:flutter/material.dart';

class Discription extends StatelessWidget {
  const Discription(
      {Key? key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launch_on})
      : super(key: key);
  final String name, description, bannerurl, posterurl, vote, launch_on;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(bannerurl, fit: BoxFit.cover),
                  )),
                  Positioned(
                      bottom: 15,
                      child: Text(
                        "⭐ Average Rating=" + vote,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.all(11),
              child: Text(name != null ? name : "Soon",
                  style: TextStyle(fontSize: 17)),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text("Releasing On " + launch_on),
            ),
            Row(
              children: [
                Container(
                    margin: EdgeInsets.all(10),
                    height: 150,
                    width: 150,
                    child: Image.network(posterurl)),
                Flexible(
                  child: Container(
                    child: Text('' + description),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
