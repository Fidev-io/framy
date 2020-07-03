import 'package:test/test.dart';
import 'package:weight_tracker/main.app.framy.dart';
import 'package:weight_tracker/models/weight_entry.dart';

void main() {
  FramyDependencyModel _getWeightEntryModel(
          {WeightEntry defaultValue, String constructor = ''}) =>
      FramyDependencyModel<WeightEntry>(
        'weightEntry',
        'WeightEntry',
        defaultValue,
        createSubDependencies('WeightEntry', constructor),
      )..constructor = constructor;

  group('framyModelConstructorMap', () {
    test('should use default constructor for WeightEntry', () {
      //given
      final model = _getWeightEntryModel();
      model.subDependencies
          .singleWhere((element) => element.name == 'note')
          .value = 'Foo';
      //when
      final weighEntry = framyModelConstructorMap['WeightEntry'](model);
      //then
      expect(weighEntry.note, 'Foo');
    });

    test('should use named for WeightEntry when its name is passed', () {
      //given
      final model = _getWeightEntryModel(constructor: '.now');
      //just to confirm:
      expect(
        model.subDependencies.any((element) => element.name == 'note'),
        isFalse,
      );
      //when
      final weighEntry = framyModelConstructorMap['WeightEntry'](model);
      //then
      //its empty because now constructor doesnt use note
      expect(weighEntry.note, '');
    });
  });
}
