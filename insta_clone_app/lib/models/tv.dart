import 'package:flutter/material.dart';

class TV extends StatelessWidget {
  final List tv;
  const TV({Key? key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Top Rated Tv Shows",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 10),
            Container(
              height: 200,
              child: ListView.builder(
                itemCount: tv.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(7),
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            width: 200,
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            tv[index]['backdrop_path']
                                                .toString()),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(height: 5),
                          Container(
                              child: Text(tv[index]['original_name'] != null
                                  ? tv[index]['original_name']
                                  : 'Loading'))
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
