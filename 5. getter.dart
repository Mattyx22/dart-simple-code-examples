import 'dart:async';

void main () {
  final bloc = new Bloc();
  
  bloc.emailController.stream.listen((value) {
    print(value);
  });
  
  bloc.email.listen((value) {
    print(value);
  });
  
  // bloc.emailController.sink.add('My new email');
  bloc.changeEmail('My new email');
}

class Bloc {
  final emailController = StreamController<String>();
  
  // Add data to stream
  get changeEmail => emailController.sink.add;
  // OR Function(String) get changeEmail => emailController.sink.add;
  // Because it adds so it can be a function
  
  // Retrieve data from stream
  get email => emailController.stream;
  // OR Stream<String> get emial => emailController.stream;
  // Stream because it just gets access to data
  
  
}

