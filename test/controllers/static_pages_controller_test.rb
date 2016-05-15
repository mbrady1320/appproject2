require 'test_helper'

class StaticPagesController < ApplicationController
  layout "static"
end
  

class StaticPagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
