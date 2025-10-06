import 'package:flutter/material.dart';

class RecipesDetailsViewBody extends StatelessWidget {
  const RecipesDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Image.network(
                        "https://www.themealdb.com//images//media//meals//ustsqw1468250014.jpg",
                        width:60 ,
                        height: 60,
                      ),
            SizedBox(height: 12),
            Text("Category"),
     
            SizedBox(height: 16),
            Text("Instructions:", style: TextStyle(fontWeight: FontWeight.bold)),

            SizedBox(height: 16),
            Text("Ingredients:", style: TextStyle(fontWeight: FontWeight.bold)),
            
          ],
        ),
    );
  }
}