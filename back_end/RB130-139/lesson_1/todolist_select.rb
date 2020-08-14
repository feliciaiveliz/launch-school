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
    @todos.clone
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
  
  def each
    @todos.each do |todo|
      yield(todo)
    end
    self
  end

  # def select
  #   result = []

  #   each do |todo|
  #     result << todo if yield(todo)
  #   end
  #   result
  # end

  def select
    list = TodoList.new(title)

    each do |todo|
      list.add(todo) if yield(todo)
    end
    list
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Felicia's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

p list.find_by_title("Buy milk")

# results = list.select { |todo| todo.done? }

# list.each do |todo|
#   puts todo
# end

# puts results.inspect

# p list.size # returns 3

# p list.first # todo1

# p list.last # todo3

# p list.to_a # array of all items

# p list.done? # true if all items are done, false

# p list.item_at                    # raises ArgumentError
# p list.item_at(1)                 # returns 2nd item in list (zero based index)
# p list.item_at(100)               # raises IndexError

# p list.mark_done_at               # raises ArgumentError
# p list.mark_done_at(1)            # marks the 2nd item as done
# p list.mark_done_at(100)          # raises IndexError

# p list.mark_undone_at             # raises ArgumentError
# p list.mark_undone_at(1)          # marks the 2nd item as not done,
# p list.mark_undone_at(100)        # raises IndexError

# p list.done!                      # marks all items as done

# p list.shift                      # removes and returns the first item in list

# p list.pop                        # removes and returns the last item in list

# p list.remove_at                  # raises ArgumentError
# p list.remove_at(1)               # removes and returns the 2nd item
# p list.remove_at(100)             # raises IndexError

# p list.to_s                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym