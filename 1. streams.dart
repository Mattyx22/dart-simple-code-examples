import 'dart:async';


class Cake {
  
}

class Order {
  String type;
  Order(this.type);
}


void main () {
  final controller = new StreamController();
  
  final order = new Order('chocolate');
  
  controller.sink.add(order);
  
  final baker = new StreamTransformer.fromHandlers(
    handleData: (cakeType, sink){
      if (cakeType == 'chocolate'){
        sink.add(new Cake());
      } else {
        sink.addError('I cant bake that type of cake');
      }
    }
  );
  
  
  
 
  controller.stream
    .map((order) => order.type)
    .transform(baker)
    .listen(
      (cake) => print('Heres your cake $cake'),
      onError: (err) => print(err)
    );
}