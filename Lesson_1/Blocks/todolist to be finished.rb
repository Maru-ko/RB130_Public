class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description=' ')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")

# puts todo1
# puts todo2
# puts todo3

# todo1.done!

# puts todo1
# puts todo2
# puts todo3

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(task)
    raise TypeError, "can only add todo objects" unless task.class == Todo 
      @todos << task
  end

  def size
    dual_vision.size
  end

  def first
    dual_vision[0]
  end

  def last
    dual_vision[-1]
  end

  def done?
    @todos.all?(&:done?)
  end

  def to_a
    dual_vision.map(&:to_s)
  end

  def item_at(idx)
    dual_vision.fetch(idx-1)
    dual_vision[idx - 1].to_s
  end

  def mark_done_at(idx)
    dual_vision.fetch(idx - 1)
    @todos[idx - 1].done!
  end

  def done!
    @todos.each { |todo| todo.done! }
  end

  def shift
    @todos.shift
  end

  def pop!
    @todos.pop
  end

  def to_s
    header = "---- #{title} ----"
    body = @todos.map(&:to_s)
    all = ([header] + [body]).join("\n")
    all
  end

  private

  def dual_vision
    @todos.clone
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")
list.add todo1
list.mark_done_at(1)
list.to_s
list.add(todo2)
list.add(todo3)
p list.size
list.to_s
p list.done?
list.done!
list.to_s
puts
p list.to_a
list.pop!
list.to_s
#list.add(1)
#list.to_s
p list.item_at(2).to_s
todo4 = Todo.new("Attend dream team study group")
list.add(todo4)
puts list.to_s