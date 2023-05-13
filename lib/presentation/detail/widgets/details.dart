import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mova/presentation/detail/bloc/detail_bloc.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      builder: (context, state) {
        if (state is LoadedState) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTitle(context: context, title: state.detailEntity.title),
                  SizedBox(
                    height: 8,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        buildDataAndRate(context),
                        SizedBox(
                          width: 16,
                        ),
                        buildOutlinedContainer(context: context, text: "13"),
                        SizedBox(
                          width: 16,
                        ),
                        buildOutlinedContainer(
                            context: context, text: "Country"),
                        SizedBox(
                          width: 16,
                        ),
                        buildOutlinedContainer(
                            context: context, text: "Subtitle")
                      ],
                    ),
                  ),
                  buildButtons(context),
                  SizedBox(
                    height: 16,
                  ),
                  const Text("Genres"),
                  SizedBox(
                    height: 8,
                  ),
                  const Text("OverView"),
                ],
              ),
            ),
          );
        } else {
          return SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }

  Padding buildButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            width: 170,
            height: 35,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.play_circle_fill_rounded,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Play",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.white),
                )
              ],
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            width: 170,
            height: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                    width: 2.5, color: Theme.of(context).primaryColor)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Iconsax.direct_inbox,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Play",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Theme.of(context).primaryColor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildOutlinedContainer(
      {required BuildContext context, required String text}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 1.7,
          )),
      child: Text(
        "$text",
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
      ),
    );
  }

  Row buildDataAndRate(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Iconsax.star_1,
          color: Theme.of(context).primaryColor,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "0.0",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).primaryColor,
              ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(
            Iconsax.arrow_right_3,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Text(
          "2022",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }

  Row buildTitle({required BuildContext context, required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Colors.black,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w600),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                "assets/icons/bookmark.svg",
                color: Colors.black,
                height: 17,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  "assets/icons/paper-plane.svg",
                  color: Colors.black,
                  height: 17,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
