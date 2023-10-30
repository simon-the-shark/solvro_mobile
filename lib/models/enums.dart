enum EstimationChoices {
  one,
  two,
  three,
  five,
  eight,
  thirteen,
  twentyOne,
}

enum ProfessionChoices {
  frontend,
  backend,
  devOps,
  uxUi,
}

enum TaskStatusChoices {
  notAssigned,
  inProgress,
  closed,
}

extension StringProfessionChoices on ProfessionChoices {
  String get string {
    switch (this) {
      case ProfessionChoices.frontend:
        return "FRONTEND";
      case ProfessionChoices.backend:
        return "BACKEND";
      case ProfessionChoices.devOps:
        return "DEVOPS";
      case ProfessionChoices.uxUi:
        return "UX/UI";
    }
  }
}
