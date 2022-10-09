import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';
import '../constants/colors.dart';

class EmptyShimmerBox extends StatelessWidget {
  final double height;
  final double width;

  const EmptyShimmerBox({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.simmerBaseColor,
      highlightColor: AppColors.simmerHighColor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.cardColor,),
        height: height,
        width: width,
      ),
    );
  }
}

class EmptyShimmerList extends StatelessWidget {
  final int count;

  const EmptyShimmerList({
    required this.count,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: count,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(padding: EdgeInsets.only(top:5.0),child: EmptyShimmerBox(width: 200, height: 100));
        }
    );
  }
}


