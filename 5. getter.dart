import 'dart:async';

void main () {
  final bloc = new Bloc();
  
  bloc.emailController.stream.listen((value) {
    print(value);
  });
  
  // bloc.emailController.sink.add('My new email');
  bloc.changeEmail('My new email');
}

class Bloc {
  final emailController = StreamController<String>();
  
  get changeEmail => emailController.sink.add;  
  
}

