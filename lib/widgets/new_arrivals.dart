import 'package:flutter/material.dart';

class NewArrivals extends StatelessWidget {
  const NewArrivals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              child: Text(
                'New arrivals',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            // ListView.builder(itemCount: 3, itemBuilder: (ctx, i){

            // },),
          ],
        ),
      ),
    );
  }
}
