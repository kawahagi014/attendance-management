#test_helperを読み込み、同ファイル内のメソッドはテスト全体で利用可能
require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  #必ず最初に実行する処理
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end

end
