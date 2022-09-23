import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_api/rick_and_morty_api.dart';
import 'package:test_rm_api/src/routes/router.gr.dart';

import '../../globals.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({
    Key? key,
  }) : super(key: key);

getStatus(value){
  if (value=='Alive') {
    return Color(0xFF16D916);
  }     else if (value=='Dead')  {
    return Color(0xFFCB051C);
  } else return Color(0xFF7D71FF);
}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Character>>(
      future: charactersClass.getAllCharacters(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data == null) {
          return Center(child: Text('Error Loading Data.'));
        } else {
          var characters = snapshot.data!;
          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              return ListTile(
                // title: Text(characters[index].name),
                // subtitle: Text('Index Number - ${index + 1}'),
                subtitle: Container(decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Color(0xFF494848),),
                  height: MediaQuery.of(context).size.height/5,
                  margin: EdgeInsets.all(5.0),
                  padding: EdgeInsets.all(10.0),
                  child: Row( mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //сделать масштабируемые картинки и элементы вообще
                    //хотела сделать как на сайте, без отступов, но тогда картинка убивает закругленность, надо подумать над этим
                    Container( decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: Color(0xFF494848),),
                        width: MediaQuery.of(context).size.width/3,
                        child:
                        // ClipOval(  child:
                        Image.network(characters[index].image, height: double.infinity, fit:BoxFit.cover)
                        // ),
                    ),
                    Container( margin: EdgeInsets.only(left:10.0),
                    child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //подумать как обрезать или переносить имена
                        Text(characters[index].name, 
                        style: TextStyle( color: Colors.white, fontSize: 18,fontWeight: FontWeight.w700,
                          fontFamily: 'FiraCode',  ),),


                        Padding(padding: EdgeInsets.only(top:2.0),
                        child:
                        Row(
                          children:  [
                          Container(
                            margin: EdgeInsets.only(right: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90),
                              color: getStatus(characters[index].status),

                              // characters[index].status=='Alive' ? Color(0xFF16D916) : Color(0xFFCB051C),
                            ),
                            width: 10, height: 10,
                          ),
                          //также подумать над переносом
                          Text(characters[index].status+' - '+characters[index].species,
                            style: TextStyle( color: Colors.white, fontSize: 14,fontWeight: FontWeight.w400,
                              fontFamily: 'FiraCode',  ),),
                        ],),),

                        Padding(padding: EdgeInsets.only(top:5.0),
                          child:
                            Text('Last known location:',
                                style: TextStyle(color: Color(0xFF999797), fontSize: 12,fontWeight: FontWeight.w600,
                                  fontFamily: 'FiraCode',  ),),
                            ),
                        Padding(padding: EdgeInsets.only(top:5.0),
                          child:
                          Text(characters[index].location.name,
                            style: TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.w400,
                              fontFamily: 'FiraCode',  ),),
                        ),
                        Padding(padding: EdgeInsets.only(top:5.0),
                          child:
                          Text('First seen in:',
                            style: TextStyle(color: Color(0xFF999797), fontSize: 12,fontWeight: FontWeight.w600,
                              fontFamily: 'FiraCode',  ),),
                        ),
                        Padding(padding: EdgeInsets.only(top:5.0),
                          child:
                              //сделать загрузку эпизода
                          Text(characters[index].name,
                            style: TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.w400,
                              fontFamily: 'FiraCode',  ),),
                        ),

                      ],),
                    ),

                  ]),
                ),
                onTap: () => AutoRouter.of(context).push(
                  SingleCharacterRoute(
                    characterId: characters[index].id,
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
