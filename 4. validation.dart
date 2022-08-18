/* HTML

<h4>Enter your email</h4>
<input />
<div style="color: red"></div>

*/

import 'dart:html';
import 'dart:async';


void main() {
  final InputElement input = querySelector('input') as InputElement;
  final DivElement div = querySelector('div') as DivElement;
  

 
//   input.onInput
//     .listen((dynamic event) => print(event.target.value));
  
  final validator = StreamTransformer.fromHandlers(
    handleData: (Event inputValue, EventSink sink) {
      if ((inputValue as dynamic).target.value.contains('@')) {
        sink.add((inputValue as dynamic).target.value);
      } else {
        sink.addError('Enter a valid email');
      }
   });

    input.onInput
//       .listen((dynamic event) => print(event.target.value));
//       .map((dynamic event) => event.target.value)
      .transform(validator)
      .listen(
        (inputValue) => div.innerHtml = 'That email looks valid!',
        onError: (err) => div.innerHtml = err
      );
  }
