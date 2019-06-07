require_relative "todo_storage_generator"
require_relative "todo_list"
# Todo管理のcliアプリ

MODE = {
  list:   "list",
  append: "append",
  update: "update",
  remove: "remove",
  search: "search"
}

sg = TodoStorageGenerator.new(ENV["STORAGE"])
storage = sg.generate

# STORAGEの指定がcsvでもdbでもjsonでもないときの対応
if storage.nil?
  puts "env var STORAGE must be one of #{TodoStorageGenerator::KIND.values}"
  exit
end

todo_list = TodoList.new(storage)

begin
  loop do
    puts "enter mode #{MODE.values}"
    mode = gets.chomp

    case mode
    when MODE[:list]
      puts "current list:"
      puts todo_list.all.map(&:format).join("\n")
    when MODE[:append]
      puts "enter task name"
      task_name = gets.chomp
      todo_list.append(task_name)
    else
      puts "not implemented yet"
    end
  end
rescue Interrupt
  todo_list.close
end

