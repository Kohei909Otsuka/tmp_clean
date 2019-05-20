require "csv"
require "fileutils"

class TodoCsvStorage

  def initialize(path)
    @path = path
    FileUtils.touch(path)
  end

  def read
    outputs = []
    CSV.foreach(@path) do |row|
      outputs << { id: row[0].to_i, name: row[1] }
    end
    return outputs
  end

  def write(objects)
    CSV.open(@path, "wb") do |csv|
      objects.each do |object|
        csv << [object[:id], object[:name]]
      end
    end
  end
end
