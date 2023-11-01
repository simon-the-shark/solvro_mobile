class ApiDetails {
  const ApiDetails({
    this.apiMasterUrl = "http://localhost:8000/api/",
    String loginApndx = "auth/login/",
    String registerApndx = "auth/register/",
    String logoutApndx = "auth/logout/",
    String projectsApndx = "projects/",
  })  : _loginApndx = loginApndx,
        _logoutApndx = logoutApndx,
        _registerApndx = registerApndx,
        _projectsApndx = projectsApndx;
  final String apiMasterUrl;
  final String _loginApndx;
  final String _registerApndx;
  final String _logoutApndx;
  final String _projectsApndx;

  String get loginUrl => apiMasterUrl + _loginApndx;
  String get registerUrl => apiMasterUrl + _registerApndx;
  String get logoutUrl => apiMasterUrl + _logoutApndx;
  String get projectsUrl => apiMasterUrl + _projectsApndx;
}
