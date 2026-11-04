import 'package:flutter_test/flutter_test.dart';
import 'package:taskflow/main.dart';

void main() {
  testWidgets('TaskFlow inicia correctamente', (tester) async {
    await tester.pumpWidget(const TaskFlowApp());

    expect(find.text('TaskFlow'), findsOneWidget);
  });
}