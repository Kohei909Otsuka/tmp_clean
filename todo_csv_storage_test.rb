require 'minitest/autorun'
require_relative 'todo_csv_storage'

class TestTodoCsvStorage < Minitest::Test
  PATH = "test_data/todo.csv"

  # test_xxxの前に毎回呼ばれる
  def setup
    @storage = TodoCsvStorage.new(PATH)
  end

  # test_xxxの後に毎回呼ばれる
  def teardown
    File.delete(PATH) if File.exist?(PATH)
  end

  def test_read
    # testする前にファイルを準備する
    objects = [
      { id: 1, name: "task1" },
      { id: 2, name: "task2" },
      { id: 3, name: "task3" },
      { id: 4, name: "task4" },
    ]

    CSV.open(PATH, "wb") do |csv|
      objects.each do |object|
        csv << [object[:id], object[:name]]
      end
    end

    assert_equal(objects, @storage.read)
  end

  def test_write
  end
end
