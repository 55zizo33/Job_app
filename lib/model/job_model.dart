class Job {
  final int id;
  final String jobTitle;
  final String companyName;
  final String status;
  final String image;
  final String location;
  final int salary;
  final String jobDescription;
  final String jobSkill;

  Job({
    required this.id,
    required this.jobTitle,
    required this.companyName,
    required this.status,
    required this.image,
    required this.location,
    required this.salary,
    required this.jobDescription, // أضف هذا الحقل
    required this.jobSkill, // أضف هذا الحقل
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'] ?? 0,
      jobTitle: json['name'] ?? '',
      companyName: json['comp_name'] ?? '',
      status: json['job_time_type'] ?? '',
      image: json['image'] ?? '',
      location: json['location'] ?? '',
      salary: int.tryParse(json['salary'].toString()) ?? 0,
      jobDescription: json['job_description'] ?? '',
      jobSkill: json['job_skill'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': jobTitle,
      'comp_name': companyName,
      'job_time_type': status,
      'image': image,
      'location': location,
      'salary': salary,
      'job_description': jobDescription,
      'job_skill': jobSkill,
    };
  }
}
