module AttendanceHelper
  #休憩時間の月合計
  def total_standerd_rest_time_calc
    total_standerd_rest_time = AttendancesController::FIXED_REST_TIME * @attendances.length
    return total_standerd_rest_time
  end

  #外出時間の月合計
  def total_rest_time_calc
    total_rest_time = 0
    @attendances.each do |attendance|
      total_rest_time += attendance.rest_time
    end
    return total_rest_time
  end

  #労働時間の月合計
  def total_work_time_calc
    total_work_time = 0
    @attendances.each do |attendance|
      total_work_time += attendance.work_time
    end
    return total_work_time
  end
end
