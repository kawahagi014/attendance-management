module ApplicationHelper
  require "holiday_japan"

  # ページごとの完全なタイトルを返す
  def full_title(page_title = "")
    base_title = "勤怠管理システム"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  # 曜日を取得
  def convert_wday(weeknum)
    week = %w[日曜日 月曜日 火曜日 水曜日 木曜日 金曜日 土曜日]
    return week[weeknum]
  end

  # 休日・祝日判定
  def check_holiday(day)
    (day.wday == 6 || day.wday == 0) || HolidayJapan.check(day)
  end
end
