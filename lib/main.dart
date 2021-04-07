import 'package:flutter/material.dart';
import 'package:the_paradise/services/get_recipe.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => GetRecipe(),
        },
      ),
    );
