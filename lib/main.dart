import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_app/views/profile_setting/Portfolio.dart';
import 'package:jobs_app/views/profile_setting/edite_profile.dart';
import 'package:jobs_app/views/profile_setting/language.dart';
import 'package:jobs_app/views/profile_setting/login_security.dart';
import 'package:jobs_app/views/profile_setting/notification3.dart';
import 'package:jobs_app/views/profile_setting/profile.dart';
import 'core/app_theme.dart';
import 'core/logic/cache_helper.dart';
import 'core/logic/helper_methods.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale("en"), Locale("ar")],
      path: "assets/translations",
      fallbackLocale: const Locale("en"),
      startLocale: const Locale("en"), // تغيير اللغة الافتراضية إلى الإنجليزية
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        title: 'Jobs',
        theme: AppTheme.light,
        navigatorKey: navigatorKey,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        home: Profile(),
        routes: {
          '/edit_profile': (context) => EditProfile(),
          '/portfolio': (context) => Portfolio(),
          '/language': (context) => Language(),
          '/notification': (context) => Notification3(),
          '/login_security': (context) => LoginSecurity(),
          // إضافة المزيد من المسارات إذا كانت الشاشات الأخرى متعلقة بـ `CompleteProfile`
        },
      ),
    );
  }
}
