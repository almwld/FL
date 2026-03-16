import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  // التحقق من صلاحيات الموقع
  static Future<bool> checkPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // التحقق من تفعيل خدمة الموقع
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    // التحقق من صلاحيات الموقع
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }

  // الحصول على الموقع الحالي
  static Future<Position?> getCurrentPosition() async {
    try {
      final hasPermission = await checkPermission();
      if (!hasPermission) {
        return null;
      }

      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      print('Error getting current position: $e');
      return null;
    }
  }

  // الحصول على العنوان من الإحداثيات
  static Future<String?> getAddressFromPosition(Position position) async {
    try {
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        final addressParts = <String>[];

        if (place.locality != null && place.locality!.isNotEmpty) {
          addressParts.add(place.locality!);
        }
        if (place.subAdministrativeArea != null && 
            place.subAdministrativeArea!.isNotEmpty) {
          addressParts.add(place.subAdministrativeArea!);
        }
        if (place.administrativeArea != null && 
            place.administrativeArea!.isNotEmpty) {
          addressParts.add(place.administrativeArea!);
        }

        return addressParts.join(', ');
      }

      return null;
    } catch (e) {
      print('Error getting address: $e');
      return null;
    }
  }

  // الحصول على المدينة من الإحداثيات
  static Future<String?> getCityFromPosition(Position position) async {
    try {
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        return place.locality ?? place.subAdministrativeArea;
      }

      return null;
    } catch (e) {
      print('Error getting city: $e');
      return null;
    }
  }

  // الحصول على الموقع الكامل
  static Future<LocationData?> getLocationData() async {
    try {
      final position = await getCurrentPosition();
      if (position == null) return null;

      final address = await getAddressFromPosition(position);
      final city = await getCityFromPosition(position);

      return LocationData(
        latitude: position.latitude,
        longitude: position.longitude,
        address: address,
        city: city,
      );
    } catch (e) {
      print('Error getting location data: $e');
      return null;
    }
  }

  // حساب المسافة بين نقطتين
  static double calculateDistance(
    double startLatitude,
    double startLongitude,
    double endLatitude,
    double endLongitude,
  ) {
    return Geolocator.distanceBetween(
      startLatitude,
      startLongitude,
      endLatitude,
      endLongitude,
    );
  }

  // تنسيق المسافة
  static String formatDistance(double distanceInMeters) {
    if (distanceInMeters < 1000) {
      return '${distanceInMeters.toStringAsFixed(0)} م';
    } else {
      final km = distanceInMeters / 1000;
      return '${km.toStringAsFixed(1)} كم';
    }
  }

  // قائمة المدن اليمنية
  static const List<String> yemeniCities = [
    'صنعاء',
    'عدن',
    'تعز',
    'الحديدة',
    'المكلا',
    'إب',
    'ذمار',
    'البيضاء',
    'سيئون',
    'شبوة',
    'مارب',
    'الجوف',
    'عمران',
    'حجة',
    'صعدة',
    'لحج',
    'أبين',
    'الضالع',
    'ريمة',
    'المحويت',
    'حضرموت',
    'سقطرى',
  ];

  // قائمة المدن السعودية
  static const List<String> saudiCities = [
    'الرياض',
    'جدة',
    'مكة المكرمة',
    'المدينة المنورة',
    'الدمام',
    'الخبر',
    'تبوك',
    'أبها',
    'نجران',
    'جازان',
    'الباحة',
    'الطائف',
    'بريدة',
    'القطيف',
    'خميس مشيط',
    'الهفوف',
    'المبرز',
    'حفر الباطن',
    'الجبيل',
    'ينبع',
  ];
}

class LocationData {
  final double latitude;
  final double longitude;
  final String? address;
  final String? city;

  LocationData({
    required this.latitude,
    required this.longitude,
    this.address,
    this.city,
  });

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'city': city,
    };
  }

  factory LocationData.fromJson(Map<String, dynamic> json) {
    return LocationData(
      latitude: json['latitude'] ?? 0.0,
      longitude: json['longitude'] ?? 0.0,
      address: json['address'],
      city: json['city'],
    );
  }
}
