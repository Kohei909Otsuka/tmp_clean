require 'minitest/autorun'
require_relative 'todo_list'

class TestTodoList < Minitest::Test
  def setup
    @data = [
      {id: 1, name: "first todo"},
      {id: 2, name: "second todo"},
    ]
    @dummy_storage = MiniTest::Mock.new
    @dummy_storage.expect(:read, @data)
    @todo_list = TodoList.new(@dummy_storage)
  end

  def test_all
		all = @todo_list.all
		first = all[0]
		second = all[1]
		assert_equal(2, all.length)
		assert_equal(Todo, first.class)
		assert_equal(Todo, second.class)
		assert_equal(
			[1, "first todo"],
			[first.id, first.name]
		)
		assert_equal(
			[2, "second todo"],
			[second.id, second.name]
		)
  end

  def test_append
    @todo_list.append("third todo")
    added = @todo_list.all.last
    assert_equal(Todo, added.class)
    assert_equal(
      [3, "third todo"],
      [added.id, added.name]
    )
  end

  def test_close
    @dummy_storage.expect(:write, nil, [@data])
    @todo_list.close
  end
end
