require_relative 'bubble_sort'

class Array
  def randomise
    bubble_sort { [-1, 1].sample }
  end
end
