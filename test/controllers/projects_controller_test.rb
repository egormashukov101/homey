require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
  end

  test "should get index" do
    get projects_path
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get show" do
    project = projects(:one)
    get project_path(project)
    assert_response :success
    assert_not_nil assigns(:project)
    assert_not_nil assigns(:comments)
    assert_not_nil assigns(:comment)
  end

  test "should get new" do
    sign_in users(:one)
    get new_project_path
    assert_response :success
    assert_not_nil assigns(:project)
  end

  test "should create project" do
    assert_difference('Project.count') do
      post projects_path, params: { project: { title: 'New Project', status: 'active' } }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should not create project with invalid attributes" do
    assert_no_difference('Project.count') do
      post projects_path, params: { project: { title: '', status: '' } }
    end

    assert_template :new
  end

  test "should get edit" do
    project = projects(:one)
    get edit_project_path(project)
    assert_response :success
    assert_not_nil assigns(:project)
  end

  test "should update project" do
    project = projects(:one)
    patch project_path(project), params: { project: { title: 'Updated Project' } }
    assert_redirected_to project_path(assigns(:project))
    project.reload
    assert_equal 'Updated Project', project.title
  end

  test "should not update project with invalid attributes" do
    project = projects(:one)
    patch project_path(project), params: { project: { title: '' } }
    assert_template :edit
    project.reload
    assert_not_equal '', project.title
  end
end
