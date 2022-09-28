import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/routes/router.gr.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthenticationPage(title: 'Authentication'),
    );
  }
}

class AuthFormDate{
  final String login;
  final String password;

  AuthFormDate({ required this.login, required this.password});
  AuthFormDate copyWith({
    String? login,
    String? password,
  }) {
    return AuthFormDate(
      login: login ?? this.login,
      password: password ?? this.password,
    );
  }
}

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
//old code, delete later
//   AuthFormDate _formState=AuthFormDate(login: '', password: '');
//   _submit(){
//     print(_formState.login);
//   }

  final store = FormStore();

  @override
  void initState(){
    super.initState();
    store.setupValidator();
  }

  @override
  void dispose(){
    super.dispose();
    store.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // title: Text(widget.title),
      ),
      body: Center(
        child: Padding (padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Icon (Icons.account_circle, size: 80.0,),
              const Padding (padding: const EdgeInsets.only(top: 30.0),
                child:
                Text(
                  'Sing in',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, ),
                ),),

              Container(margin: const EdgeInsets.only(top:80.0) , width:210.0, child: Column( mainAxisAlignment: MainAxisAlignment.start,
                  children:[
                    Row( mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'Login:',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, ),
                          ), ]),
                    Observer(builder: (context)=>TextField(
                      // decoration: InputDecoration(
                      //   label: Text('Login')
                      // ),
                      decoration: InputDecoration(
                        hintText: 'Enter your login',
                        errorText: store.error.username,
                      ),
                      onChanged: (value) => store.name=value,
                    ),),

                    Observer(builder: ((context){
                      return AnimatedOpacity(
                        opacity: store.isUserCheckPending ? 1 : 0, duration: const Duration(microseconds: 300),
                        child: const LinearProgressIndicator(),
                      );
                    })),

                    Padding (padding: const EdgeInsets.only(top: 10.0),
                      child: Row( mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Password:',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, ),
                            ),
                          ]),
                    ),

                    Observer(builder: (context)=>TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        errorText: store.error.password,
                      ),
                      onChanged: (value) => store.password=value,
                    ),),

                    Observer(builder: ((context){
                      return AnimatedOpacity(
                        opacity: store.isPasswordCheckPending ? 1 : 0, duration: const Duration(microseconds: 300),
                        child: const LinearProgressIndicator(),
                      );
                    })),


                    Row( mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding (padding: const EdgeInsets.only(top: 5.0),
                          child:
                          ElevatedButton(
                              onPressed:() {store.validateAll;
                              if (store.validateAll()){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AppWidget()));
                              }},

                              child: Container(height:20.0, width:50.0,  child: const Text(
                                'Enter',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, ),
                              ),
                              )
                          ),
                        ),],
                    ),
                  ]),),


            ],
          ),
        ),
      ),
    );
  }
}


class AppWidget extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.black45),
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Rick & Morty App',
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
