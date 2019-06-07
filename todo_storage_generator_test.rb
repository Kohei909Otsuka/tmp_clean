require 'minitest/autorun'
require_relative 'todo_storage_generator'

class TestTodoStorageGenerator < Minitest::Test
  def test_generate
    sg1 = TodoStorageGenerator.new(nil)
    sg2 = TodoStorageGenerator.new("")
    sg3 = TodoStorageGenerator.new("abcde")
    sg4 = TodoStorageGenerator.new("csv")

    assert_equal(nil, sg1.generate)
    assert_equal(nil, sg2.generate)
    assert_equal(nil, sg3.generate)
    assert_equal(TodoCsvStorage, sg4.generate.class)
  end
end
