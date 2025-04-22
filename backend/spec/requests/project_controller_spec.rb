require 'rails_helper'

RSpec.describe "ProjectControllers", type: :request do
  include Committee::Rails::Test::Methods
  fixtures :projects
  describe 'GET /projects' do
    it 'conforms to schema with 200 response code' do
      get projects_path
      assert_schema_conform(200)
    end

    it 'conforms to request schema' do
      get projects_path
      assert_request_schema_confirm
    end

    it 'conforms to response schema with 200 response code' do
      get projects_path
      assert_response_schema_confirm(200)
    end
  end

  describe 'GET /projects/:id' do
    it 'conforms to schema with 200 response code' do
      get project_path(projects(:one))
      assert_schema_conform(200)
    end

    it 'conforms to request schema' do
      get project_path(projects(:one))
      assert_request_schema_confirm
    end

    it 'conforms to response schema with 200 response code' do
      get project_path(projects(:one))
      assert_response_schema_confirm(200)
    end
  end

  describe 'DELETE /projects/:id' do
    it 'conforms to schema with 200 response code' do
      delete project_path(projects(:one))
      assert_schema_conform(200)
      assert_request_schema_confirm
      assert_response_schema_confirm(200)
    end
  end

  describe 'DELETE /projects/:id' do
    it 'conforms to schema with 404 response code' do
      delete project_path(400)
      assert_schema_conform(404)
      assert_request_schema_confirm
      assert_response_schema_confirm(404)
    end
  end
end
