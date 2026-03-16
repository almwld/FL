# Flex Yemen - منصة التجارة الإلكترونية اليمنية

تطبيق Flex Yemen هو منصة تجارة إلكترونية يمنية متكاملة تنافس المنصات العالمية مثل Amazon و Alibaba.

## المميزات الرئيسية

### 1. نظام المصادقة والحساب الشخصي
- تسجيل الدخول برقم الموبايل والبريد الإلكتروني
- خيار الدخول كضيف
- إنشاء حساب جديد (تاجر/عميل)
- استعادة كلمة المرور
- ملف شخصي متكامل

### 2. الصفحة الرئيسية
- سلايدر متحرك مع 5 شرائح ترويجية
- قسم "مزيد من ما تريد" مع أيقونات سريعة
- قسم مزاد الجنابي الأسبوعي
- قسم العقارات والاستثمارات
- قسم الإلكترونيات والتقنية

### 3. المحفظة الإلكترونية
- 3 عملات (ريال يمني، ريال سعودي، دولار)
- 22 خدمة مالية متكاملة:
  - إيداع وسحب
  - تحويلات مالية
  - دفع فواتير
  - شحن رصيد
  - بطاقات هدايا
  - وغيرها...

### 4. نظام الإعلانات
- إضافة إعلان جديد مع صور متعددة
- عرض جميع الإعلانات مع فلاتر
- صفحة تفاصيل الإعلان
- نظام المزادات
- العروض والتخفيضات

### 5. التواصل
- نظام محادثات فوري
- دعم فني
- إبلاغ عن إعلان

### 6. الإعدادات
- الوضع الداكن/الفاتح
- إعدادات الإشعارات
- إعدادات الأمان
- اللغة

## التقنيات المستخدمة

- **Flutter 3.22+** - إطار العمل
- **Dart 3.0+** - لغة البرمجة
- **Supabase** - قاعدة البيانات والمصادقة
- **Provider** - إدارة الحالة
- **Hive** - التخزين المحلي
- **Geolocator** - خدمات الموقع

## هيكل المشروع

```
lib/
├── main.dart                      # نقطة الدخول
├── models/                        # نماذج البيانات
│   ├── user_model.dart
│   ├── ad_model.dart
│   └── wallet_model.dart
├── providers/                     # إدارة الحالة
│   └── theme_manager.dart
├── screens/                       # جميع الشاشات
│   ├── splash_screen.dart
│   ├── login_screen.dart
│   ├── register_screen.dart
│   ├── main_navigation.dart
│   ├── home_screen.dart
│   ├── wallet_screen.dart
│   ├── add_ad_screen.dart
│   ├── chat_screen.dart
│   ├── chat_detail_screen.dart
│   ├── profile_screen.dart
│   ├── account_info_screen.dart
│   ├── my_ads_screen.dart
│   ├── favorites_screen.dart
│   ├── notifications_screen.dart
│   ├── search_screen.dart
│   ├── all_ads_screen.dart
│   ├── ad_detail_screen.dart
│   ├── my_orders_screen.dart
│   └── wallet/                    # 22 صفحة محفظة
├── services/                      # الخدمات
│   ├── supabase_service.dart
│   ├── cache/
│   │   └── local_storage_service.dart
│   └── location_service.dart
├── theme/                         # الثيم
│   └── app_theme.dart
└── widgets/                       # الويدجات المشتركة
    ├── custom_app_bar.dart
    ├── custom_button.dart
    ├── custom_text_field.dart
    ├── ad_card.dart
    └── loading_widget.dart
```

## كيفية التشغيل

1. **تثبيت المتطلبات:**
```bash
flutter pub get
```

2. **تشغيل التطبيق:**
```bash
flutter run
```

3. **بناء إصدار Release:**
```bash
flutter build apk --release
```

## إعداد Supabase

1. أنشئ مشروع Supabase جديد
2. أضف الجداول المطلوبة (users, ads, wallets, chats, transactions)
3. قم بتحديث `url` و `anonKey` في `lib/main.dart`

## الهوية البصرية

- **الألوان الذهبية**: #D4AF37, #F4D03F, #C6A700
- **الخط**: Changa SemiBold
- **التصميم**: عصري مع لمسات ذهبية

## المطور

تم تطوير هذا التطبيق باستخدام Flutter و Dart.

## الترخيص

هذا المشروع مفتوح المصدر.
