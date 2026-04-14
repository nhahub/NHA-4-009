import '../Services/questionnaire_service.dart';
import '../models/question_model.dart';
import '../models/questionnaire_answers_model.dart';
import '../models/questionnaire_model.dart';

class QuestionnaireRepo {
  final QuestionnaireService _questionnaireService;

  QuestionnaireRepo({required QuestionnaireService questionnaireService})
    : _questionnaireService = questionnaireService;

  List<QuestionModel> getQuestions() {
    return onboardingQuestionnaire.questions;
  }

  Future<void> saveQuestionnaireAnswers(QuestionnaireAnswersModel model) async {
    await _questionnaireService.saveQuestionnaireAnswers(model);
  }
}
