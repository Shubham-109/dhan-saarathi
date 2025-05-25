import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khazana/data/repositories/charts_repository.dart';
import 'package:khazana/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/index.dart';
import 'core/network/api_service.dart';
import 'cubits/auth/auth_cubit.dart';
import 'cubits/charts/charts_cubit.dart';
import 'cubits/home/home_cubit.dart';
import 'cubits/watchlist/watchlist_cubit.dart';
import 'data/repositories/auth_repository.dart';
import 'data/repositories/home_repository.dart';
import 'data/repositories/watchlist_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://sngwfuhdwqrfgokupxfo.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNuZ3dmdWhkd3FyZmdva3VweGZvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDc5Mjc2NjUsImV4cCI6MjA2MzUwMzY2NX0.sUIhqjTg9rV1jF34bc7Y70eYoCGIOLG440FI1Clgk_8',
  );
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final ApiService apiClient = ApiService(sharedPreferences: sharedPreferences);
  runApp(
    MyApp(
      prefs: sharedPreferences,
      authRepository: AuthRepository(apiService: apiClient, sharedPreferences: sharedPreferences),
      homeRepository: HomeRepository(apiService: apiClient),
      watchlistRepository: WatchlistRepository(apiService: apiClient),
      chartsRepository: ChartsRepository(apiService: apiClient),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository;
  final HomeRepository homeRepository;
  final WatchlistRepository watchlistRepository;
  final ChartsRepository chartsRepository;
  final SharedPreferences prefs;
  const MyApp({
    super.key,
    required this.prefs,
    required this.authRepository,
    required this.homeRepository,
    required this.watchlistRepository,
    required this.chartsRepository,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(440, 956),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AuthCubit(authRepository: authRepository)),
          BlocProvider(create: (_) => HomeCubit(homeRepository: homeRepository)),
          BlocProvider(create: (_) => WatchlistCubit(watchlistRepository: watchlistRepository, prefs: prefs)..getAllWatchlistNames()),
          BlocProvider(create: (_) => ChartsCubit(chartsRepository: chartsRepository)..fetchFund('100119')),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConstants.appName,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.dark,
          onGenerateRoute: Routes.generateRoute,
          onUnknownRoute: Routes.errorRoute,
          builder: (context, child) {
            return MediaQuery(data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)), child: child!);
          },
        ),
      ),
    );
  }
}
