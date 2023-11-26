import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/constants/constants.dart';
import 'package:weather_app/src/features/weather/presentation/bloc/load/bloc.dart';
import '../bloc/weather/bloc.dart';
import '../widgets/background.dart';
import 'home.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageBackground(
      children: [
        BlocProvider<MainBloc>(
          create: (create) => MainBloc()..add(DeterminePosition()),
          child: BlocBuilder<MainBloc, MainState>(
            builder: (builder, state) {
              if (state is MainSuccess) {
                context
                    .read<WeatherBlocBloc>()
                    .add(FetchWeather(state.position));
                return const HomePage();
              } else if (state is MainFailure) {
                return Center(
                  child: Text(state.msg, style: AppTextStyle.style4),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
