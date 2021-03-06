# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = "X"
  UNDONE_MARKER = ""

  attr_accessor :title, :description, :done

  def initialize(title, description="")
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def undone!
    self.done = false
  end

  def done?
    done
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

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

todo1.done!

puts todo1
puts todo2
puts todo3

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def <<(todo)
    raise TypeError, "You can only add 'Todo' objects" unless todo.instance_of?(Todo)

    @todos << todo
  end

  alias_method :add, :<<

  def size
    @todos.size
  end
  
  def first
    @todos.first
  end
  
  def last
    @todos.last
  end
  
  def to_a
    @todos.to_a
  end
  
  def done?
    @todos.all? { |item| item.done? }
  end
  
  def item_at(index)
    @todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done!
    @todos.each do |todo|
      todo.done!
    end
  end
  
  # or

  # def done!
  #   @todos.each_index do |idx|
  #     mark_done_at(idx)
  #   end
  # end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    @todos.delete_at(item_at(index))
  end
  
  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end
end

list = TodoList.new("Felicia's Todos")

# add

list.add(todo1)
list.add(todo2)
list.add(todo3)
list.size # returns 3
list.first # todo1
list.last # todo3
list.to_a # array of all items
list.done? # true if all items are done, false
# list.item_at(1)                 # returns 2nd item in list (zero based index)
list.mark_undone_at(1)          # marks the 2nd item as not done,
list.done!                      # marks all items as done
list.shift                      # removes and returns the first item in list
list.pop                        # removes and returns the last item in list
# list.remove_at(1)               # removes and returns the 2nd item
list.to_s                      # returns string representation of the list
