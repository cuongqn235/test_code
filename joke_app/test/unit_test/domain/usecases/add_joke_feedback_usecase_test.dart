import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:joke_app/domain/entities/add_joke_feedback_input.dart';
import 'package:joke_app/domain/repositories/joke/i_joke_repository.dart';
import 'package:joke_app/domain/usecases/joke/add_joke_feedback_usecase.dart';
import 'package:mockito/mockito.dart';

class MockIJokeRepository extends Mock implements IJokeRepository {}

void main() {
  group('AddJokeFeedbackUseCase test', () {
    test('should add joke feedback', () async {
      // Arrange
      final mockJokeRepository = MockIJokeRepository();
      final addJokeFeedbackInput = AddJokeFeedbackInput(1, true);
      final expectedResult = right(unit);

      // Mock the addJokeFeedback method to return a dummy future
      when(mockJokeRepository.addJokeFeedback(addJokeFeedbackInput))
          .thenAnswer((_) => Future.value());

      // Act
      final actualResult = await AddJokeFeedbackUseCase(mockJokeRepository)
          .execute(addJokeFeedbackInput);

      // Assert
      expect(actualResult, expectedResult);
    });

    test('should throw an error when add joke feedback fails', () async {
      // Arrange
      final mockJokeRepository = MockIJokeRepository();
      final addJokeFeedbackInput = AddJokeFeedbackInput(1, true);
      final expectedError = Exception('Failed to add joke feedback');

      // Mock the addJokeFeedback method to throw an error
      when(mockJokeRepository.addJokeFeedback(addJokeFeedbackInput))
          .thenAnswer((_) => Future.error(expectedError));

      // Act
      final actualResult = await AddJokeFeedbackUseCase(mockJokeRepository)
          .execute(addJokeFeedbackInput);

      // Assert
      expect(actualResult, left(expectedError));
    });
  });
}
