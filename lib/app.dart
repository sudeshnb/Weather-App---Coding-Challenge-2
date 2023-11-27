import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/features/weather/presentation/bloc/weather/bloc.dart';
import 'package:weather_app/src/features/weather/presentation/cubit/save.location.dart';
import 'src/core/config/config.dart';
import 'package:flutter/material.dart';
import 'src/core/routes/routes.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (create) => WeatherBlocBloc()),
        BlocProvider(create: (create) => SaveLocationCubic()),
      ],
      child: const ScreenUtilInit(
        designSize: Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: DismissKeyboard(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            checkerboardRasterCacheImages: true,
            initialRoute: RoutesName.initial,
            onGenerateRoute: AppRoute.generate,
          ),
        ),
      ),
    );
  }
}
