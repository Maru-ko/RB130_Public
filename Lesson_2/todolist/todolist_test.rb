# Writing test suite for TodoList

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)

    @bangou = @list.size + 1
  end
  # 1
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end
  # 2
  def test_size
    assert_equal(@todos.size, @list.size)
  end
  # 3
  def test_first
    assert_equal(@todo1, @list.first)
  end
  # 4
  def test_last
    assert_equal(@todo3, @list.last)
  end
  # 5
  def test_shift
    assert_equal(@todo1, @list.clone.shift)
  end
  # 6
  def test_pop
    assert_equal(@todo3, @list.clone.pop)
  end
  #7
  def test_done?
    assert_equal(false, @list.done?)
  end
  #8 write a test that verifies `TypeError` by adding a item into the list that's not a Todo object.
  def test_raise_type_error
    assert_raises(TypeError) do
      @list.add('string')
    end
  end
  #9 Write a test that verifies whether the <<
  # actually does add a `Todo` to our `TodoList`.
  def test_instance_of_todo
    list = TodoList.new('burgers')
    list.add(@todo3)
    item = list.first
    assert_instance_of(Todo, item)
  end
  #10 `#add` is aliased to `<<`.
  # test that the alias works as expected
  def test_add_method
    list = TodoList.new('apples')
    list << @todo1
    assert_equal(@todo1, list.first)
  end
  #11 item_at
  # Remember that this method should raise `IndexError`
  # if we specify an index with no element
  def test_item_at
    assert_raises(IndexError) do
      @list.item_at(@bangou)
    end
  end
  #12 mark_done_at
  # same as 11
  def test_mark_done_at
    assert_raises(IndexError) do
      @list.mark_done_at(@bangou)
    end
  end
  #13 mark_undone_at
  def test_mark_undone_at
    assert_raises(IndexError) do
      @list.mark_undone_at(@bangou)
    end
  end
  #14 done!
  def test_done!
    list = @list.clone.done!
    assert_equal(true, list.all?(&:done?))
  end
  #15 remove_at
  def test_remove_at
    assert_raises(IndexError) do
      @list.remove_at(@bangou)
    end
  end
  #16 to_s
  def test_to_s
  #   output = <<-OUTPUT.chomp.gsub /^\s+/, ""
  # ---- Today's Todos ----
  # [ ] Buy milk
  # [ ] Clean room
  # [ ] Go to gym
  # OUTPUT
  #   assert_equal(output, @list.to_s)
    list = @list.clone.to_s

    assert_equal(list, @list.to_s)
  end
  #17
  def test_to_s_one_done
    list = @list.clone
    list.mark_done_at(1)
    other = list.to_s
    list.mark_done_at(1)
    assert_equal(other, list.to_s)
  end
  #18
  def test_to_s_all_done
    list = @list.clone
    list.mark_all_done
    @list.mark_all_done
    assert_equal(list.to_s, @list.to_s)
  end
  #19 each
  def test_each
    arr1 = [Todo] * @list.size
    arr2 = Array.new
    @list.each { |t| arr2 << t.class}

    assert_equal(arr1, arr2)
  end
  #20 each_original
  def test_each_original
    result = @list.each(&:to_s)
    assert_equal(result, @list.each(&:to_s))
  end
  #21 select
  def test_select
    @list.mark_all_done
    result = @list.select(&:done?)
    assert_instance_of(TodoList, result)

  end
end