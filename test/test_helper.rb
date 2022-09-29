ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase

  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Add more helper methods to be used by all tests here...
  # fixtures :all
  include ApplicationHelper

  # テストユーザーがログイン中の場合にtrueを返す
  def is_logged_in?
    !session[:user_id].nil?
  end
end
