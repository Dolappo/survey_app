import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:personavey/app/app_setup.router.dart';
import 'package:personavey/screen/category/category_screen.dart';
import 'app/app_setup.locator.dart';
import 'core/models/question_model.dart';

class AppController extends BaseViewModel {
  final _navigate = locator<NavigationService>();

  List<Question> answer = [];

  int pageIndex = 0;

  String nextButton(Cats type) {
    if (pageIndex != checkTypeLength(type) - 1) {
      return 'Next';
    } else {
      return 'Submit';
    }
  }

  void nextPage(Cats type, viewModel) {
    if (pageIndex != checkTypeLength(type) - 1) {
      pageIndex++;

      notifyListeners();
    } else {
      navigate(Routes.previewAnswerScreen,
          arguments: PreviewAnswerScreenArguments(type: type, viewModel:viewModel ));
    }
  }

  void navigate(String route, {dynamic arguments}) {
    _navigate.navigateTo(route, arguments: arguments);
  }

  void previousPage() {
    if (pageIndex != 0) {
      pageIndex--;
      notifyListeners();
    }
  }

  void navigateToType(int index) {
    if (index == 0) {
      _navigate.navigateTo(Routes.questionsScreen,
          arguments: QuestionsScreenArguments(type: Cats.love));
    } else if (index == 1) {
      _navigate.navigateTo(Routes.questionsScreen,
          arguments: QuestionsScreenArguments(type: Cats.health));
    } else if (index == 2) {
      _navigate.navigateTo(Routes.questionsScreen,
          arguments: QuestionsScreenArguments(type: Cats.education));
    } else {
      _navigate.navigateTo(Routes.questionsScreen,
          arguments: QuestionsScreenArguments(type: Cats.politics));
    }
  }

  void updateOption(String? value, int index, Cats type) {
    checkType(type).answer = value!;
    // answer = List.filled(checkTypeLength(type), Question(),growable: true);
      answer.insert(pageIndex, checkType(type));
    notifyListeners();
  }

  int checkTypeLength(Cats type) {
    if (type == Cats.health) {
      return healthQuestion.length;
    } else if (type == Cats.politics) {
      return politicsQuestion.length;
    } else if (type == Cats.love) {
      return loveQuestion.length;
    } else {
      return eduQuestion.length;
    }
  }

  Question checkType(Cats type) {
    if (type == Cats.health) {
      return healthQuestion[pageIndex];
    } else if (type == Cats.education) {
      return eduQuestion[pageIndex];
    } else if (type == Cats.love) {
      return loveQuestion[pageIndex];
    } else {
      return politicsQuestion[pageIndex];
    }
  }

  final List<Question> _loveQuestion = [
    Question(
      questionText: "What is your marital status? ",
      type: Cats.love,
      options: [
        "Single",
        "Married",
        "Divorced",
        "Widowed",
      ],
    ),
    Question(
        questionText: "Employment Status of respondent",
        type: Cats.love,
        options: [
          "Self-employed",
          "Employed",
          "Unemployed",
          "Student",
        ]),
    Question(
      questionText: "How old are you now? ",
      type: Cats.love,
      options: [
        "0-20",
        "21-40",
        "41-60",
        "61 and above",
      ],
    ),
    Question(
        questionText: "What is your current weight?",
        type: Cats.love,
        options: [
          "50-70",
          "71-80",
          "80-90",
          "91 and above",
        ]),
  ];

  final List<Question> _politicsQuestion = [
    Question(
      questionText: "What is your marital status?",
      type: Cats.politics,
      options: [
        "Single",
        "Married",
        "Divorced",
        "Widowed",
      ],
    ),
    Question(
        questionText: "Employment Status of respondent:",
        type: Cats.politics,
        options: [
          "Self-employed",
          "Employed",
          "Unemployed",
          "Student",
        ]),
    Question(
      questionText: "How old are you now? ",
      type: Cats.politics,
      options: [
        "0-20",
        "21-40",
        "41-60",
        "61 and above",
      ],
    ),
    Question(
        questionText: "What is your current weight? ",
        type: Cats.politics,
        options: [
          "50-70",
          "71-80",
          "80-90",
          "91 and above",
        ]),
  ];

  final List<Question> _healthQuestion = [
    Question(
      questionText: "What is your marital status? ",
      type: Cats.health,
      options: [
        "Single",
        "Married",
        "Divorced",
        "Widowed",
      ],
    ),
    Question(
        questionText: "Employment Status of respondent:",
        type: Cats.health,
        options: [
          "Self-employed",
          "Employed",
          "Unemployed",
          "Student",
        ]),
    Question(
      questionText: "How old are you now? ",
      type: Cats.health,
      options: [
        "0-20",
        "21-40",
        "41-60",
        "61 and above",
      ],
    ),
    Question(
        questionText: "What is your current weight? ",
        type: Cats.health,
        options: [
          "50-70",
          "71-80",
          "80-90",
          "91 and above",
        ]),
  ];

  final List<Question> _eduQuestion = [
    Question(
      questionText: "What is your marital status? ",
      type: Cats.education,
      options: [
        "Single",
        "Married",
        "Divorced",
        "Widowed",
      ],
    ),
    Question(
        questionText: "Employment Status of respondent:",
        type: Cats.education,
        options: [
          "Self-employed",
          "Employed",
          "Unemployed",
          "Student",
        ]),
    Question(
      questionText: "How old are you now? ",
      type: Cats.education,
      options: [
        "0-20",
        "21-40",
        "41-60",
        "61 and above",
      ],
    ),
    Question(
        questionText: "What is your current weight? ",
        type: Cats.education,
        options: [
          "50-70",
          "71-80",
          "80-90",
          "91 and above",
        ]),
  ];

  List<Question> get eduQuestion => _eduQuestion;
  List<Question> get loveQuestion => _loveQuestion;
  List<Question> get healthQuestion => _healthQuestion;
  List<Question> get politicsQuestion => _politicsQuestion;

  final List<String> _cat = ['Love', 'Health', 'Education', 'Politics'];

  List<String> get cat => _cat;
}
