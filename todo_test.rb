require 'minitest/autorun'
require_relative 'todo'

class TestTodo < Minitest::Test
  def setup
    @todo = Todo.new(1, "dummy")
  end

  def test_accessor
    assert_equal(1, @todo.id)
    assert_equal("dummy", @todo.name)
  end
end
