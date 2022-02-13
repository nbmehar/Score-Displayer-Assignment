import 'package:freezed_annotation/freezed_annotation.dart';

// 2. Declare this:
part 'current_state.freezed.dart';

// 3. Annotate the class with @freezed
@freezed
// 4. Declare the class as abstract and add `with _$ClassName`
abstract class CurrentState with _$CurrentState {
  // 5. Create a `const factory` constructor for each valid state
  const factory CurrentState.noError() = _NoError;
  const factory CurrentState.error(String errorText) = _Error;
  const factory CurrentState.loading() = _Loading;
}

