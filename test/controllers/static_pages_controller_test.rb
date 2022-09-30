# test_helperを読み込み、同ファイル内のメソッドはテスト全体で利用可能
require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  # 必ず最初に実行する処理
  def setup
    @base_title = "勤怠管理システム"
  end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end
end
