import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:travel_planner/app/app.router.dart';

import 'app/app.locator.dart';
import 'presentation/common/bottom_sheet/setup_bottom_sheet.dart';
import 'presentation/common/dialog/setup_dialog.dart';
import 'presentation/common/snackbar/setup_snackbar.dart';
import 'presentation/design/theme_setup.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await setupLocator();
  await ThemeManager.initialise();
  await dotenv.load(fileName: ".env");
  setupSnackbarUi();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultThemeMode: ThemeMode.light,
      statusBarColorBuilder: (theme) => Colors.transparent,
      lightTheme: lightTheme,
      darkTheme: darkTheme,
      builder: (context, regularTheme, darkTheme, themeMode) {
        return MaterialApp(
          title: 'Travel Planner',
          theme: regularTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.light, //FIXME: Add support for dark theme
          navigatorKey: StackedService.navigatorKey,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          // localizationsDelegates: const [
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          //   GlobalCupertinoLocalizations.delegate,
          // ],
          supportedLocales: const [Locale('en', '')],
        );
      },
    );
  }
}
