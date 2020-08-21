def test2(block)
  puts "hello"
  puts block.class
  block.call if block_given?
  puts "good-bye"
end


def test(&block)
  puts "用意"
  test2(block)
  yield
  block.call
  puts "スタート！"
end


test { puts "自分は自分たれ"}

test2 'hi'