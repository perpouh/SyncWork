require 'rails_helper'

RSpec.describe "ProjectControllers", type: :request do
  include Committee::Rails::Test::Methods
  fixtures :projects

  # index
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

  # create
  describe 'POST /projects' do
    it 'conforms to schema with 201 response code' do
      post projects_path,
        params: {
          project: {
            id: 'PROJECT_THREE',
            project_name: 'New Project',
            description: 'New Project'
          }
        }.to_json,
        headers: { 'Content-Type' => 'application/json' }

      assert_schema_conform(201)
      assert_request_schema_confirm
      assert_response_schema_confirm(201)
    end

    it 'confirm to schema with 422 response code' do
      post projects_path,
      params: {
        project: {
          id: 'PROJECT_FOUR'
        }
      }.to_json,
        headers: { 'Content-Type' => 'application/json' }
      assert_schema_conform(422)
      assert_request_schema_confirm
      assert_response_schema_confirm(422)
    end
  end

  # update
  describe 'PATCH /projects/:id' do
    it 'conforms to schema with 200 response code' do
      patch project_path(projects(:one)),
        params: {
          project: {
            project_name: 'Updated Project'
          }
        }.to_json,
        headers: { 'Content-Type' => 'application/json' }

      assert_schema_conform(200)
      assert_request_schema_confirm
      assert_response_schema_confirm(200)
    end

    it 'conforms to schema with 422 response code' do
      patch project_path(projects(:one)),
        params: {
          project: {
            id: 'PROJECT_TWO'
          }
        }.to_json,
        headers: { 'Content-Type' => 'application/json' }

      assert_schema_conform(422)
      assert_request_schema_confirm
      assert_response_schema_confirm(422)
    end
  end

  # show
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

  # delete
  # describe 'DELETE /projects/:id' do
  #   it 'conforms to schema with 200 response code' do
  #     delete project_path(projects(:one))
  #     assert_schema_conform(200)
  #     assert_request_schema_confirm
  #     assert_response_schema_confirm(200)
  #   end
  # end

  # describe 'DELETE /projects/:id' do
  #   it 'conforms to schema with 404 response code' do
  #     delete project_path(400)
  #     assert_schema_conform(404)
  #     assert_request_schema_confirm
  #     assert_response_schema_confirm(404)
  #   end
  # end
end
