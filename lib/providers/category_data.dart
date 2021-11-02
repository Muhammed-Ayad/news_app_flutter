import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/category_models.dart';

final categoryProvider = ChangeNotifierProvider<GetCategories>((ref) {
  return GetCategories();
});

class GetCategories extends ChangeNotifier {
  List<CategoryModels> _category = [
    CategoryModels(
      categoryName: 'Business',
      imageUrl:
          'https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80',
    ),
    CategoryModels(
      categoryName: 'Entertainment',
      imageUrl:
          'https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
    ),
    CategoryModels(
      categoryName: 'General',
      imageUrl:
          'https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    ),
    CategoryModels(
      categoryName: 'Health',
      imageUrl:
          'https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80',
    ),
    CategoryModels(
      categoryName: 'Science',
      imageUrl:
          'https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80',
    ),
    CategoryModels(
      categoryName: 'Sports',
      imageUrl:
          'https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80',
    ),
    CategoryModels(
      categoryName: 'Technology',
      imageUrl:
          'https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
    ),
  ];
  List<CategoryModels> get category {
    return [..._category];
  }
}
