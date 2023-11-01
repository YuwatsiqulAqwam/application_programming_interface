import 'package:application_programming_interface/model/recipesdetail.dart';
import 'package:flutter/material.dart';
import '../viewmodel/services.dart';

class DetailPage extends StatefulWidget {
  final String id;

  const DetailPage({super.key, required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  RecipeDetail? data;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    getRecipeDetail(widget.id).then((value) {
      setState(() {
        data = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: Text(
            "Resep Makanan",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                padding: const EdgeInsets.only(top: 55),
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(data!.meals[0].strMealThumb),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data!.meals[0].strMeal,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data!.meals[0].strCategory,
                              style: TextStyle(fontSize: 20),
                            ),
                            Icon(
                              Icons.thumb_up,
                              size: 30,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          data!.meals[0].strInstructions,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 30),
                        Text(
                          'ingredient : \n' +
                              data!.meals[0].strIngredient1 +
                              '\n' +
                              data!.meals[0].strIngredient2 +
                              '\n' +
                              data!.meals[0].strIngredient3 +
                              '\n' +
                              data!.meals[0].strIngredient4 +
                              '\n' +
                              data!.meals[0].strIngredient5 +
                              '\n' +
                              data!.meals[0].strIngredient6 +
                              '\n' +
                              data!.meals[0].strIngredient7 +
                              '\n' +
                              data!.meals[0].strIngredient8 +
                              '\n' +
                              data!.meals[0].strIngredient9 +
                              '\n' +
                              data!.meals[0].strIngredient10 +
                              '\n' +
                              data!.meals[0].strIngredient11 +
                              '\n' +
                              data!.meals[0].strIngredient12,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
