import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../empty_shimmer_objects.dart';

class EmptyLocationsPage extends StatelessWidget {
  const EmptyLocationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
          return ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) {return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.cardColor,
              ),
              height: 150,
              margin: EdgeInsets.all(5.0),
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: EmptyShimmerBox(
                      height: 30,
                      width: 200,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: EmptyShimmerBox(
                      height: 15,
                      width: 200,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: EmptyShimmerBox(
                      height: 20,
                      width: 200,
                    ),
                  ),
                ],
              ),
            );
            },
          );
  }
}
