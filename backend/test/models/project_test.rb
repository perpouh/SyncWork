require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save project without id" do
    project = Project.new(project_name: "Project A", description: "A sample description")
    assert_not project.save
    assert project.errors[:id].present?
  end
  test "should not save project with duplicate id" do
    project1 = Project.create(id: "PJ_A", project_name: "Project A", description: "A sample description")
    project2 = Project.new(id: "PJ_A", project_name: "Project B", description: "Another sample description")
    assert_not project2.save
    assert project2.errors[:id].present?
  end
  test "should not save project with invalid id" do
    project = Project.new(id: "にほんご", project_name: "Project A", description: "A sample description")
    assert_not project.save
    assert project.errors[:id].present?
  end
  test "should not save project without project_name" do
    project = Project.new(description: "A sample description")
    assert_not project.save
    assert project.errors[:project_name].present?
  end

  test "should not save project without description" do
    project = Project.new(project_name: "Project A")
    assert_not project.save
    assert project.errors[:description].present?
  end

  test "should save project with valid attributes" do
    project = Project.new(id: "PJ_A", project_name: "Project A", description: "A sample description")
    assert project.save
  end
end
