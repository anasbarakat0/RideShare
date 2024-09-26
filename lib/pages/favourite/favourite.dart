import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:rideshare_/bloc/favourite/delete_favourite_bloc.dart';
import 'package:rideshare_/bloc/favourite/get_favourite_bloc.dart';
import 'package:rideshare_/colors.dart';
import 'package:rideshare_/repo/favourite/delete_favourite_repo.dart';
import 'package:rideshare_/repo/favourite/get_favourite_repo.dart';
import 'package:rideshare_/service/favourite/delete_favourite_service.dart';
import 'package:rideshare_/service/favourite/get_favourite_service.dart';
import 'package:rideshare_/widgets.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetFavouriteBloc(
            GetFavouriteRepo(
              getFavouriteService: GetFavouriteService(
                Dio(),
              ),
            ),
          )..add(GetAllFavourite()),
        ),
        BlocProvider(
          create: (context) => DeleteFavouriteBloc(
            DeleteFavouriteRepo(
              deleteFavouriteService: DeleteFavouriteService(
                Dio(),
              ),
            ),
          ),
        ),
        BlocListener<DeleteFavouriteBloc, DeleteFavouriteState>(
          listener: (context, state) {
            if (state is DeleteFavourite) {
              context.read<GetFavouriteBloc>().add(GetAllFavourite());
              infoMessage(
                context,
                state.deletedRespond.status,
                [state.deletedRespond.message],
              );
            } else if (state is BadDeleteResponse) {
              errorMessage(
                context,
                state.badFavoriteRespond.status,
                [state.badFavoriteRespond.message],
              );
            } else if (state is ExceptionDeleteRespond) {
              errorMessage(
                context,
                "Exception",
                [state.exceptionFavoriteRespond.message],
              );
            }
          },
        )
      ],
      child: Builder(builder: (context) {
        return Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 60,
                  left: 15,
                  right: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightGreen100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Builder(builder: (context) {
                        return IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: const Icon(Icons.menu_outlined),
                        );
                      }),
                    ),
                    const Text(
                      'Favourite',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 34,
                      width: 34,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<GetFavouriteBloc, GetFavouriteState>(
              builder: (context, state) {
                if (state is AddedToFavourite) {
                  return Flexible(
                    child: ListView.builder(
                      itemCount: state.allFavouriteRespond.body.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 4),
                          child: Slidable(
                            startActionPane: ActionPane(
                                motion: const StretchMotion(),
                                children: [
                                  SlidableAction(
                                      backgroundColor:
                                          const Color.fromRGBO(211, 47, 47, 1),
                                      label: "Delete",
                                      icon: Icons.delete,
                                      onPressed: (context2) {
                                        deletingDialog(
                                          context,
                                          (bool run) {
                                            if (run) {
                                              context
                                                  .read<DeleteFavouriteBloc>()
                                                  .add(
                                                    DeleteItem(
                                                      id: state
                                                          .allFavouriteRespond
                                                          .body[index]
                                                          .id,
                                                    ),
                                                  );
                                            }
                                          },
                                          "You are going to remove this bicycle from favourite",
                                        );
                                      })
                                ]),
                            child: Container(
                              height: 93,
                              width: 363,
                              decoration: BoxDecoration(
                                color: AppColors.lightGreen,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: AppColors.greenIcon,
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                  top: 16,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  state
                                                      .allFavouriteRespond
                                                      .body[index]
                                                      .bicycle
                                                      .model_price
                                                      .model,
                                                  style: TextStyle(
                                                      color: AppColors.darkGrey,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  "( //${state.allFavouriteRespond.body[index].bicycle.model_price.price.toString()} S.P )",
                                                  style: TextStyle(
                                                      color: AppColors.green,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  state.allFavouriteRespond
                                                      .body[index].bicycle.type,
                                                  style: TextStyle(
                                                      color: AppColors.darkGrey,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  '  |  ',
                                                  style: TextStyle(
                                                      color: AppColors.darkGrey,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  state.allFavouriteRespond
                                                      .body[index].bicycle.size
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: AppColors.darkGrey,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              state.allFavouriteRespond
                                                  .body[index].bicycle.note,
                                              style: TextStyle(
                                                  color: AppColors.green,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            height: 59,
                                            width: 101,
                                            child: Image.network(
                                              "https://${state.allFavouriteRespond.body[index].bicycle.photoPath}",
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (BuildContext context,
                                                      Object exception,
                                                      StackTrace? stackTrace) {
                                                return const Icon(Icons
                                                    .image_not_supported_rounded);
                                              },
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is ExceptionRespond) {
                  return Text(state.exceptionFavoriteRespond.message);
                } else if (state is BadResponse) {
                  return const Text("There is no favourites found");
                } else {
                  return const CircularProgressIndicator();
                }
              },
            )
          ],
        );
      }),
    );
  }
}
