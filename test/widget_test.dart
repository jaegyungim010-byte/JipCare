import 'package:flutter_test/flutter_test.dart';
import 'package:jip_care/app/app.dart';

void main() {
  testWidgets('home exposes the primary senior-friendly actions', (tester) async {
    await tester.pumpWidget(const JipCareApp());

    expect(find.text('집케어'), findsOneWidget);
    expect(find.text('매물 보기'), findsOneWidget);
    expect(find.text('새 매물 등록'), findsOneWidget);
    expect(find.text('연락처'), findsOneWidget);
    expect(find.text('오늘 할 일'), findsOneWidget);
    expect(find.text('설정 / 백업'), findsOneWidget);
  });
}
