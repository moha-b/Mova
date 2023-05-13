import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mova/core/functions/func.dart';
import 'package:mova/core/widgets/button.dart';
import 'package:mova/presentation/detail/bloc/detail_bloc.dart';

import 'expanded_text.dart';

class TextDetailsSection extends StatelessWidget {
  const TextDetailsSection({Key? key}) : super(key: key);

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
                  buildTitleSection(
                      context: context, title: state.detailEntity.title),
                  const SizedBox(
                    height: 8,
                  ),
                  buildPropertySection(state, context),
                  buildButtonsSection(context),
                  Text("Genres : ${showGenres(state.detailEntity.genres)}"),
                  const SizedBox(
                    height: 8,
                  ),
                  ExpandableText(text: state.detailEntity.overview),
                ],
              ),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }

  SingleChildScrollView buildPropertySection(
      LoadedState state, BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          showRateAndDate(
            movie: state.detailEntity,
            context: context,
          ),
          BuildButton(
            text: state.detailEntity.productionCountries.isNotEmpty
                ? state.detailEntity.productionCountries[0]["name"]
                : "Undefined",
            textColor: Theme.of(context).primaryColor,
            iconButton: false,
            border: true,
            borderRadius: 5,
            marginHorizontal: 10,
          ),
          BuildButton(
              text: showTime(movie: state.detailEntity),
              textColor: Theme.of(context).primaryColor,
              iconButton: false,
              border: true,
              borderRadius: 5),
          BuildButton(
            text: showRevenue(movie: state.detailEntity),
            textColor: Theme.of(context).primaryColor,
            iconButton: false,
            border: true,
            borderRadius: 5,
            marginHorizontal: 10,
          )
        ],
      ),
    );
  }

  Padding buildButtonsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Row(
        children: [
          const Expanded(
            child: BuildButton(
              height: 40,
              text: "Play",
              iconButton: true,
              border: false,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: BuildButton(
              height: 40,
              text: "Download",
              iconButton: true,
              icon: Iconsax.direct_inbox,
              iconColor: Theme.of(context).primaryColor,
              textColor: Theme.of(context).primaryColor,
              border: true,
            ),
          ),
        ],
      ),
    );
  }

  Row buildTitleSection(
      {required BuildContext context, required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                overflow: TextOverflow.ellipsis, fontWeight: FontWeight.w600),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                "assets/icons/bookmark.svg",
                color: Theme.of(context).textTheme.displaySmall?.color,
                height: 17,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  "assets/icons/paper-plane.svg",
                  color: Theme.of(context).textTheme.displaySmall?.color,
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
