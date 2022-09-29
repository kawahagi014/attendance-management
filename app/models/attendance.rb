class Attendance
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user

  field :work_date, type: Date
  field :start_time, type: Time, default: nil
  field :end_time, type: Time, default: nil
  field :work_time, type: Integer, default: 0
  field :rest_start_time, type: Array, default: []
  field :rest_end_time, type: Array, default: []
  field :rest_time, type: Integer, default: 0
  #1:出勤中 2:休憩中 3:退勤
  field :status_flg, type: Integer

  validates :user_id, presence: true
  validates :work_date, presence: true

  index({user_id: 1, work_date: 1}, { unique: true })
end
