import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/animation/animation.dart';
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
                return AppFailureWidget(msg: state.msg);
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

class AppFailureWidget extends StatelessWidget {
  const AppFailureWidget({super.key, required this.msg});
  final String msg;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppPadding.main,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              msg,
              textAlign: TextAlign.center,
              style: AppTextStyle.style7,
            ),
            AppSpace.h50,
            ShrinkButton(
              onPressed: () {
                context.read<MainBloc>().add(DeterminePosition());
              },
              child: Container(
                decoration: AppDecoration.previewCard,
                padding: AppPadding.button,
                child: Text(
                  'Try again',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.style7,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
