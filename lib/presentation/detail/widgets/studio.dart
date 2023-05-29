import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mova/core/util/constance.dart';
import 'package:mova/presentation/detail/bloc/detail_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../domain/entities/detail_entity.dart';
import '../../../domain/entities/production_company_entity.dart';

class StudioSection extends StatelessWidget {
  const StudioSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DetailEntity? movie;
    List<ProductionCompanyEntity> studio = [];

    return BlocBuilder<DetailBloc, DetailState>(
      builder: (context, state) {
        if (state is LoadedState) {
          movie = state.detailEntity;
          try {
            studio = movie!.productionCompanies
                .where((company) => company.logoPath != null)
                .toList();
          } catch (e) {}
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    " Studios",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 140,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: studio.length,
                      itemBuilder: (context, index) => SizedBox(
                        width: 100,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 90,
                              width: 90,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  child: CachedNetworkImage(
                                    imageUrl: Api.getImageUrl(
                                        studio[index].logoPath!),
                                    placeholder: (context, url) =>
                                        Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: Container(),
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 8, top: 8),
                              child: Text(
                                studio[index].name,
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis),
                              ),
                            )
                          ],
                        ),
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(width: 10),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return SliverToBoxAdapter(
            child: Center(
              child: SvgPicture.asset(
                "assets/icons/exclamation.svg",
                color: Color(0xffEE5253),
              ),
            ),
          );
        }
      },
    );
  }
}
