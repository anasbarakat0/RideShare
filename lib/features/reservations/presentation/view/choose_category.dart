import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare_/features/reservations/presentation/bloc/get_all_bicycles_categories_bloc.dart';
import 'package:rideshare_/core/resources/colors.dart';
import 'package:rideshare_/features/hubs/presentation/view/select_avilable_bicycle.dart';
import 'package:rideshare_/features/reservations/data/repository/get_all_bicycles_categories_repo.dart';
import 'package:rideshare_/features/reservations/data/sources/remote/get_all_bicycles_categories_service.dart';

class ChooseCategory extends StatefulWidget {
  final int fromId;
  final int toId;
  final String fromName;
  final String toName;
  const ChooseCategory(
      {super.key,
      required this.fromId,
      required this.toId,
      required this.fromName,
      required this.toName});

  @override
  State<ChooseCategory> createState() => _ChooseCategoryState();
}

class _ChooseCategoryState extends State<ChooseCategory> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllBicyclesCategoriesBloc(
        GetAllBicyclesCategoriesRepo(
          getAllBicyclesCategoriesService: GetAllBicyclesCategoriesService(
            Dio(),
          ),
        ),
      )..add(GetBicyclesCategories()),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Select the bicycl type",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            backgroundColor: Colors.white,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const FittedBox(
                child: Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Icon(Icons.arrow_back_ios_new_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Back',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              BlocConsumer<GetAllBicyclesCategoriesBloc,
                  GetAllBicyclesCategoriesState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is SuccessGettingAllBicyclesCategories) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: state.successGettingCategories.body.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  (MaterialPageRoute(
                                    builder: (context) =>
                                        SelectAvilableBicyclePage(
                                      fromId: widget.fromId,
                                      toId: widget.toId,
                                      fromName: widget.fromName,
                                      toName: widget.toName,
                                      roadBikes: state
                                          .successGettingCategories.body[index],
                                    ),
                                  )),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 16,
                                ),
                                child: Container(
                                  height: 48,
                                  width: 362,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.lightGreen,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: AppColors.greenIcon, width: 1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const SizedBox(width: 20),
                                        Text(
                                          state.successGettingCategories
                                              .body[index],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.typeGrey,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                          child: Icon(
                                            Icons.navigate_next,
                                            color: AppColors.typeGrey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  } else if (state is ExceptionCategories) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
