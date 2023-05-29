import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mova/core/util/constance.dart';
import 'package:mova/presentation/detail/bloc/detail_bloc.dart';
import 'package:shimmer/shimmer.dart';

class DetailAppBarSection extends StatelessWidget {
  const DetailAppBarSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(builder: (context, state) {
      if (state is LoadedState) {
        return SliverAppBar(
          floating: false,
          leadingWidth: 25,
          pinned: true,
          stretch: true,
          // onStretchTrigger: (){
          //   // Refresh the page
          // },
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Iconsax.arrow_left_2)),
          flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.blurBackground,
                StretchMode.zoomBackground
              ],
              background: CachedNetworkImage(
                imageUrl: Api.getImageUrl(state.detailEntity.backdropPath),
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(),
                ),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
                fit: BoxFit.cover,
              )),
          expandedHeight: 350,
        );
      } else {
        return SliverToBoxAdapter(
            child: Center(
          child: CircularProgressIndicator(),
        ));
      }
    });
  }
}
