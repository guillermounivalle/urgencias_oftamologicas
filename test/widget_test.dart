
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:urgencias_oftamologicas/src/ui/home_page.dart';

//Inicia ejecución
void main() {
  testWidgets('Estado inicial, debe mostrar el Home_Page',
    (WidgetTester tester) async {   //GIVEN
      await Firebase.initializeApp();
      var widget = HomePage(); //Constructor de la clase

      //WHEN
      await tester.pumpWidget(widget); //Crea los componentes de la clase en un entorno virtual

      //THEN
      //Resultado esperado Función Expect
       expect(find.text('Usuario'),findsOneWidget);
       expect(find.text('Administrador'),findsOneWidget);
       expect(find.text('No Existo'),findsNothing);
  });
}
