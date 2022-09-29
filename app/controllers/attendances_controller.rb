class AttendancesController < ApplicationController
  #所定休憩時間
  REST_TIME = 1.0

  def index
    @month_cnt =
    if params[:next_cnt].present?
      params[:next_cnt].to_i + 1
    elsif params[:prev_cnt].present?
      params[:prev_cnt].to_i - 1
    else
      0
    end

    @days = Date.today.months_since(@month_cnt).all_month
    @user = User.find(session[:user_id])
    @attendances = @user.attendances.where(:work_date.gte => @days.first, :work_date.lte => @days.last).to_a
  end

  #出勤時
  def create
    @user = User.find(session[:user_id])
    @attendance = Attendance.new
    @attendance.user_id = @user.id
    @attendance.work_date = Date.today
    @attendance.start_time = Time.now
    @attendance.status_flg = 1
    if @attendance.save
      redirect_to @user
    else
      flash.now[:danger] = @attendance.errors.full_messages
      render @user
    end
  end

  #退勤時
  def update_work_end
    @user = User.find(session[:user_id])
    @attendance = @user.attendances.all.sort(work_date: -1).first
    @attendance.end_time = Time.now
    @attendance.work_time = convert_hour(Time.now - @attendance.start_time) - REST_TIME
    @attendance.status_flg = 3
    if @attendance.save
      redirect_to @user
    else
      flash.now[:danger] = @attendance.errors.full_messages
      render @user
    end
  end

  #休憩開始時
  def update_rest_start
    @user = User.find(session[:user_id])
    @attendance = @user.attendances.all.sort(work_date: -1).first
    @attendance.rest_start_time.push(Time.now)
    @attendance.status_flg = 2
    if @attendance.save
      redirect_to @user
    else
      flash.now[:danger] = @attendance.errors.full_messages
      render @user
    end
  end

  #休憩終了時
  def update_rest_end
    @user = User.find(session[:user_id])
    @attendance = @user.attendances.all.sort(work_date: -1).first
    @attendance.rest_end_time.push(Time.now)
    @attendance.rest_time += convert_hour(Time.now - @attendance.rest_start_time.last)
    @attendance.status_flg = 1
    if @attendance.save
      redirect_to @user
    else
      flash.now[:danger] = @attendance.errors.full_messages
      render @user
    end
  end

  private
  #Time→時.分への変換処理
  def convert_hour(time)
    hour = (time / 60 / 60).floor(2)
  end
end
