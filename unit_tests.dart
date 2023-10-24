import 'package:test/test.dart';
import 'package:your_package_name_here/location.dart';
import 'package:frisbee_time/frisbee_time.dart';

void main() {
  group('Location', () {
    test('should return the correct latitude and longitude for Boston Common', () {
      final bostonCommon = Location(42.3541165, -71.0656341);
      expect(bostonCommon.latitude, equals(42.3541165));
      expect(bostonCommon.longitude, equals(-71.0656341));
    });
  });

  group('FrisbeeTime', () {
    test('nextSundayNightAtMidnight returns the correct DateTime', () {
      final nextSundayNight = FrisbeeTime.nextSundayNightAtMidnight();
      final expectedDateTime = DateTime.now().add(Duration(days: DateTime.sunday - DateTime.now().weekday, hours: 24));
      expect(nextSundayNight, expectedDateTime);
    });
  });
}
