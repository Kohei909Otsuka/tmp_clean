require_relative "todo_csv_storage"

class TodoStorageGenerator
  KIND = {
    csv: "csv",
    json: "json",
    db: "db",
  }

  def initialize(kind)
    @kind = kind
  end

  def generate
    case @kind
    when KIND[:csv]
      return TodoCsvStorage.new("data/todo.csv")
    when KIND[:json]
      # TODO: 実装
      return nil
    when KIND[:db]
      # TODO: 実装
      return nil
    else
      return nil
    end
  end
end
