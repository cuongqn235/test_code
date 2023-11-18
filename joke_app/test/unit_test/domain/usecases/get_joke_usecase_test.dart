import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:joke_app/domain/entities/joke_entity.dart';
import 'package:joke_app/domain/repositories/joke/i_joke_repository.dart';
import 'package:joke_app/domain/usecases/joke/get_joke_usecase.dart';
import 'package:mockito/mockito.dart';

class MockIJokeRepository extends Mock implements IJokeRepository {}

void main() {
  group('GetJokeUseCase test', () {
    test('should get joke successfully', () async {
      // Arrange
      final mockJokeRepository = MockIJokeRepository();
      final expectedJoke = JokeEntity(
          id: 1, isFunny: null, descriptionJoke: 'joke', createdAt: 'type');
      when(mockJokeRepository.getJokeModelDontFunny())
          .thenAnswer((_) => Future.value(expectedJoke));

      // Act
      final actualResult = await GetJokeUseCase(mockJokeRepository).execute();

      // Assert
      expect(actualResult, right(expectedJoke));
    });

    test('should throw an error when getting joke fails', () async {
      // Arrange
      final mockJokeRepository = MockIJokeRepository();
      final expectedError = Exception('Failed to get joke');
      when(mockJokeRepository.getJokeModelDontFunny())
          .thenAnswer((_) => Future.error(expectedError));

      // Act
      final actualResult = await GetJokeUseCase(mockJokeRepository).execute();

      // Assert
      expect(actualResult, left(expectedError));
    });
  });
}
