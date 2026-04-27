import '../activity/activity_category_model.dart';

class DummyActivitiesCategories {
  static List<ActivityCategoryModel> dummyActivitiesCategories = List.generate(
    5,
    (index) => const ActivityCategoryModel(id: "", name: "", imageUrl: ""),
  );
}
