import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../empty_shimmer_objects.dart';


getStatus(value){
  if (value=='Alive') {
    return AppColors.aliveColor;
  }     else if (value=='Dead')  {
    return AppColors.deadColor;
  } else return AppColors.unknowColor;
}

class EmptyCharactersPage extends StatelessWidget {
  const EmptyCharactersPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
          return ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) {
              return
                Container( decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: AppColors.cardColor,),
                height: 150,
                margin: EdgeInsets.all(5.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(right:10.0),
                        child:
                        EmptyShimmerBox(width: 150, height: 150),
                       ),

                      Column( crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(top:5.0),
                            child:
                            EmptyShimmerBox(height: 30,width: 200,),
                          ),
                          Padding(padding: EdgeInsets.only(top:5.0),
                            child:
                            EmptyShimmerBox(height: 15,width: 200),
                          ),


                          Padding(padding: EdgeInsets.only(top:5.0),
                            child:
                            EmptyShimmerBox(height: 20,width: 200),
                          ),
                          Padding(padding: EdgeInsets.only(top:5.0),
                            child:
                            EmptyShimmerBox(height: 30,width: 200),
                          ),

                        ],),
                      // ),
                    ]),
              );
            },
          );
        }
      }

