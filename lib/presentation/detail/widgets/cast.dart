import 'package:flutter/material.dart';

class CastSection extends StatelessWidget {
  const CastSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 150,
        child: GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 16),
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 2.2,
          ),
          itemCount: 3,
          itemBuilder: (context, index) => _cast(),
        ),
      ),
    );
  }

  Container _cast() {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Row(
        children: [
          CircleAvatar(radius: 25),
          SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Actor Name"),
              Text("Character"),
            ],
          )
        ],
      ),
    );
  }
}
