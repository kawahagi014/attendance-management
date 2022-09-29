module UsersHelper
  #ボタンのdisable判定
  def button_controll
    if @attendance.nil? || @attendance.work_date != Date.today
      return 0
    else
      return @attendance.status_flg
    end
  end

  #表示用ステータス名の返却
  def disp_status
    status_name = case button_controll
    when 0
      '出勤前'
    when 1
      '出勤中'
    when 2
      '休憩中'
    when 3
      '退勤'
    end
    return status_name
  end
end
