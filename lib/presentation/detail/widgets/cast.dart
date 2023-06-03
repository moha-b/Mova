import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mova/core/util/constance.dart';
import 'package:mova/domain/entities/cast_entity.dart';
import 'package:mova/presentation/detail/bloc/detail_bloc.dart';

class CastSection extends StatelessWidget {
  const CastSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      builder: (context, state) {
        if (state is LoadedState) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 150,
              child: GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 16),
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 2.4,
                ),
                itemCount: state.detailEntity.cast.length,
                itemBuilder: (context, index) =>
                    _cast(state.detailEntity.cast[index], context),
              ),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget _cast(CastEntity cast, context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 8),
        child: Row(
          children: [
            CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  Api.getImageUrl(cast.profilePath),
                )),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cast.character,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(overflow: TextOverflow.ellipsis),
                  ),
                  Text(
                    cast.name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
