import 'package:test/test.dart';
import 'package:manabie_challenge/bloc/bloc.dart';

main() {
  group('CardBloc', () {
    CardBloc cardBloc;

    setUp(() {
      cardBloc = CardBloc();
    });

    test('initial state is instance of CardUninitialized', () {
      expect(cardBloc.currentState is CardUninitialized, true);
    });
  });
}
