# xxxxx_test.rbという名前のファイル名の文字列の配列を取得
str_tests = Dir["./*_test.rb"]

# 取得したファイル名をrequire
str_tests.each do |str_path|
  require str_path
end
