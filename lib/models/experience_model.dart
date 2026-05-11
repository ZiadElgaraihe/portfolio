class ExperienceModel {
  final String? company;
  final String description;
  final DateTime? endDate;
  final bool isCurrentJob;
  final String jobTitle;
  final String? location;
  final DateTime startDate;

  const ExperienceModel._({
    this.company,
    required this.description,
    this.endDate,
    required this.isCurrentJob,
    required this.jobTitle,
    this.location,
    required this.startDate,
  });

  factory ExperienceModel.current({
    String? company,
    required String description,
    required String jobTitle,
    String? location,
    required DateTime startDate,
  }) => ExperienceModel._(
    company: company,
    description: description,
    jobTitle: jobTitle,
    location: location,
    startDate: startDate,
    isCurrentJob: true,
  );

  factory ExperienceModel.past({
    String? company,
    required String description,
    required DateTime endDate,
    required String jobTitle,
    String? location,
    required DateTime startDate,
  }) => ExperienceModel._(
    company: company,
    description: description,
    jobTitle: jobTitle,
    location: location,
    startDate: startDate,
    isCurrentJob: false,
    endDate: endDate,
  );
}
