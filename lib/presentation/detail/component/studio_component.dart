import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mova/core/resources/colors.dart';
import 'package:mova/core/util/constance.dart';
import 'package:mova/presentation/detail/bloc/detail_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/util/enums.dart';
import '../../../domain/entities/detail_entity.dart';
import '../../../domain/entities/production_company_entity.dart';

class StudioComponent extends StatelessWidget {
  const StudioComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DetailEntity? movie;
    List<ProductionCompanyEntity> studio = [];

    return BlocBuilder<DetailBloc, DetailState>(
      builder: (context, state) {
        movie = state.detailEntity;
        try {
          studio = movie!.productionCompanies
              .where((company) => company.logoPath != null)
              .toList();
        } catch (e) {}
        switch (state.state) {
          case RequestState.loading:
            return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          case RequestState.loaded:
            return SliverToBoxAdapter(
              child: Container(
                height: 140.h,
                padding: EdgeInsets.all(8.0.w),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: studio.length,
                  itemBuilder: (context, index) => SizedBox(
                    width: 100.w,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 90.h,
                          width: 90.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0.r),
                            child: Container(
                              padding: EdgeInsets.all(8.w),
                              color: ColorPalette.darkForeground,
                              child: CachedNetworkImage(
                                imageUrl:
                                    Network.imageUrl(studio[index].logoPath!),
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    color: Colors.white,
                                  ),
                                ),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 8.w, top: 8.h),
                          child: Text(
                            studio[index].name,
                            style: TextStyle(overflow: TextOverflow.ellipsis),
                          ),
                        )
                      ],
                    ),
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(width: 10.w),
                ),
              ),
            );
          case RequestState.error:
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
