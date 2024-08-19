require "test_helper"

class TodoTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should not save todo without name" do
    todo = Todo.new
    assert_not todo.save, "Save todo without name"
  end
end
