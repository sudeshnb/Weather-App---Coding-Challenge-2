import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/src/core/animation/animation.dart';
import 'package:weather_app/src/core/constants/constants.dart';
import 'package:weather_app/src/features/weather/presentation/cubit/search.dart';
import '../cubit/save.location.dart';

class LocationAddButton extends StatelessWidget {
  const LocationAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ShrinkButton(
      onPressed: () => onPressed(context),
      child: Container(
        height: 54.w,
        margin: AppPadding.cardMargin,
        decoration: AppDecoration.previewCard,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.add),
              AppSpace.w10,
              Text('Add new', style: AppTextStyle.style10),
            ],
          ),
        ),
      ),
    );
  }

  void onPressed(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (builder) => const SearchLocationBottomSheet(),
    );
  }
}

class SearchLocationBottomSheet extends StatelessWidget {
  const SearchLocationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubic(),
      child: BlocBuilder<SearchCubic, SearchState>(
        builder: (context, state) {
          return Container(
            decoration: AppDecoration.bottomSheet,
            clipBehavior: Clip.hardEdge,
            child: const Column(
              children: [_SearchTextField(), _SearchBody()],
            ),
          );
        },
      ),
    );
  }
}

class _SearchTextField extends StatelessWidget {
  const _SearchTextField();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.w,
      padding: AppPadding.main,
      color: AppColor.white.withOpacity(0.2),
      child: Row(
        children: [
          SvgPicture.asset(AppIcons.search, width: 30.0),
          Expanded(
            child: TextField(
              onChanged: (text) => context.read<SearchCubic>().onSearch(text),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search..',
                hintStyle: AppTextStyle.style4,
                contentPadding: AppPadding.main,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchBody extends StatelessWidget {
  const _SearchBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubic, SearchState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            padding: AppPadding.main,
            itemCount: state.list.length,
            itemBuilder: (itemBuilder, index) {
              return ShrinkButton(
                onPressed: () => onPressed(context, state.list[index].cityName),
                child: ListTile(
                  title: Text(
                    state.list[index].cityName,
                    style: AppTextStyle.style4,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void onPressed(BuildContext context, String cityName) {
    context.read<SaveLocationCubic>().searchCity(cityName);
    Navigator.pop(context);
  }
}
