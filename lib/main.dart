import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stac/stac.dart';
import 'package:menu_cart/utils/console_logger.dart';

import 'app/app_pages.dart';
import 'app/init_bindings.dart';
import 'core/storage/hive.dart';
import 'stac_runtime/stac_registry.dart';
import 'utils/urls.dart';
import 'shared/pages/custom_error_page.dart';

const String _stacBaseUrl = 'http://localhost:8090';

Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      PaintingBinding.instance.imageCache.maximumSizeBytes = 200 << 20;

      Widget app;

      try {
        await GetStorage.init();
        await HiveService.initialize();
        await Stac.initialize(
          baseUrl: _stacBaseUrl,
          parsers: StacParsers.parsers,
          actionParsers: StacParsers.actionParsers,
          logStackTraces: true,
          showErrorWidgets: true,
          cacheConfig: const bool.fromEnvironment('STAC_LOCAL_DEV')
              ? const StacCacheConfig(strategy: StacCacheStrategy.networkOnly)
              : null,
        );

        InitBindings().dependencies();

        // Use GetMaterialApp with Flutter pages for full functionality
        app = GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialBinding: InitBindings(),
          getPages: AppPages.flutterPages,
          initialRoute: '/menu',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: const Color(0xFFFFF8F3),
          ),
          useInheritedMediaQuery: true,
        );
      } catch (e, stackTrace) {
        ConsoleLogger.error(
          '==INITIALIZATION ERROR==',
          name: "INIT ERROR",
          error: e,
          stackTrace: stackTrace,
        );
        app = GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: CustomErrorPage(
            error: e.toString(),
            appLogo: '',
          ),
        );
      }

      runApp(app);
    },
    (error, stackTrace) {
      ConsoleLogger.error(
        '==UNCAUGHT DART ERROR==',
        name: "DART ERROR",
        error: error,
        stackTrace: stackTrace,
      );
    },
  );
}
