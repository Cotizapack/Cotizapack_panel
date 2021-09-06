import 'package:cotizaweb/app/data/services/categoryuser.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('Get category', () {
    CategoryUserServices categoryUserServices = CategoryUserServices();

    categoryUserServices.getCategoryUser().then((value) {
      expect(value, isNotNull);
      expect(value!.length, greaterThan(0));

      for (var item in value) {
        expect(item.id, isNotNull);
        expect(item.name, isNotNull);
      }
    });
  });
}
