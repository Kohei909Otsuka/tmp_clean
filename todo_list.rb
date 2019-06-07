require_relative "todo"

class TodoList
  def initialize(storage)
    # NOTE: storageはreadメソッドとwirteメソッドを
    # 持つようなinterface
    @storage = storage
    @list = @storage.read.map do |hash|
      Todo.new(hash[:id], hash[:name])
    end
  end

  # NOTE: 持ってるTodoクラスのオブジェクトを全部返す
  def all
    return @list
  end

  # NOTE: 指定されたnameをもつTodoクラスのオブジェクトを
  # 追加する
  def append(todo_name)
    id = @list.map {|todo| todo.id}.sort.last.to_i + 1
    @list << Todo.new(id, todo_name)
  end

  # NOTE: @listを永続化する
  def close
    hashed_todos = @list.map do |todo|
      {id: todo.id, name: todo.name}
    end
    @storage.write(hashed_todos)
  end
end
