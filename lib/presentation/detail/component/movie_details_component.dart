import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mova/domain/entities/detail_entity.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/util/constance.dart';
import '../../../core/util/enums.dart';
import '../bloc/detail_bloc.dart';

class MovieDetailsComponent extends StatelessWidget {
  const MovieDetailsComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DetailEntity? movie;
    return BlocBuilder<DetailBloc, DetailState>(builder: (context, state) {
      movie = state.detailEntity;
      switch (state.state) {
        case RequestState.loading:
          return SliverToBoxAdapter(
              child: SizedBox(
                  height: 185.h,
                  child: const Center(child: CircularProgressIndicator())));
        case RequestState.loaded:
          return SliverAppBar(
            floating: false,
            leadingWidth: 25.w,
            pinned: true,
            title: Text(
              movie!.title,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            stretch: true,
            // onStretchTrigger: (){
            //   // Refresh the page
            // },
            backgroundColor: Colors.black,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Iconsax.arrow_left_2)),
            actions: [
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  "assets/icons/bookmark.svg",
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.w),
                child: GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    "assets/icons/paper-plane.svg",
                    color: Colors.white,
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.blurBackground,
                StretchMode.fadeTitle
              ],
              background: CachedNetworkImage(
                imageUrl: Network.imageUrl(movie!.backdropPath!),
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
                fit: BoxFit.cover,
              ),
            ),
            expandedHeight: 300.h,
          );
        case RequestState.error:
          return const SliverToBoxAdapter(
              child: Center(child: Icon(Icons.error)));
      }
    });
  }
}
