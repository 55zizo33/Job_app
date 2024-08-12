import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:jobs_app/model/job_model.dart';

part 'job_state.dart';

class JobCubit extends Cubit<JobState> {
  JobCubit() : super(JobInitial());

  final Dio _dio = Dio();

  Future<void> fetchJobs() async {
    try {
      emit(JobLoading());
      print('Fetching jobs...');

      final response = await _dio.get(
        'https://project2.amit-learning.com/api/jobs',
        options: Options(
          headers: {
            'Authorization': 'Bearer 12831|I2ZrJvSR1RjYuDWhEb8dBavOU01T9HDdsNUXUKUJ', // استخدم التوكن الجديد
            'Accept': 'application/json',
          },
        ),
      );

      print('Response: ${response.data}');

      // التعامل مع الاستجابة ككائن
      final data = response.data['data'] as List;
      final List<Job> jobs = data.map((job) => Job.fromJson(job)).toList();

      emit(JobLoaded(jobs));
    } catch (e) {
      print('Error: $e');
      emit(JobError('Failed to fetch jobs'));
    }
  }
}
