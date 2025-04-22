require 'rails_helper'

RSpec.describe "UserControllers", type: :request do
  include Committee::Rails::Test::Methods
  fixtures :users
  fixtures :offices
  fixtures :departments
  describe 'GET /users' do
    it 'conforms to schema with 200 response code' do
      get users_path
      assert_schema_conform(200)
    end

    it 'conforms to request schema' do
      get users_path
      assert_request_schema_confirm
    end

    it 'conforms to response schema with 200 response code' do
      get users_path
      assert_response_schema_confirm(200)
    end
  end

  describe 'GET /users/:id' do
    it 'conforms to schema with 200 response code' do
      get user_path(users(:one))
      assert_schema_conform(200)
    end

    it 'conforms to request schema' do
      get user_path(users(:one))
      assert_request_schema_confirm
    end

    it 'conforms to response schema with 200 response code' do
      get user_path(users(:one))
      assert_response_schema_confirm(200)
    end
  end
  describe 'DELETE /users/:id' do
    it 'conforms to schema with 200 response code' do
      delete user_path(users(:one))
      assert_schema_conform(200)
      assert_request_schema_confirm
      assert_response_schema_confirm(200)
    end

    it 'conforms to schema with 404 response code' do
      delete user_path(400)
      assert_schema_conform(404)
      assert_request_schema_confirm
      assert_response_schema_confirm(404)
    end
  end
end
