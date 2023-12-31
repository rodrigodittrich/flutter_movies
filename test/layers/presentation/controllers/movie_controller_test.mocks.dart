// Mocks generated by Mockito 5.4.3 from annotations
// in flutter_movies/test/layers/presentation/controllers/movie_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:flutter_movies/src/commons_dependencies/commons_dependencies.dart'
    as _i2;
import 'package:flutter_movies/src/layers/domain/entities/movie_page.dart'
    as _i5;
import 'package:flutter_movies/src/layers/domain/exception/movie_exception.dart'
    as _i6;
import 'package:flutter_movies/src/layers/domain/usecases/all_movies/all_movies_use_case.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeResult_0<S extends Object, F extends Object> extends _i1.SmartFake
    implements _i2.Result<S, F> {
  _FakeResult_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AllMoviesUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockAllMoviesUseCase extends _i1.Mock implements _i3.AllMoviesUseCase {
  MockAllMoviesUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Result<_i5.MoviePage, _i6.MovieException>> call(
          {required Map<String, dynamic>? params}) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#params: params},
        ),
        returnValue:
            _i4.Future<_i2.Result<_i5.MoviePage, _i6.MovieException>>.value(
                _FakeResult_0<_i5.MoviePage, _i6.MovieException>(
          this,
          Invocation.method(
            #call,
            [],
            {#params: params},
          ),
        )),
      ) as _i4.Future<_i2.Result<_i5.MoviePage, _i6.MovieException>>);
}
