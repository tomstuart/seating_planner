class Array
  def bubble_sort(&block)
    clone.bubble_sort!(&block)
  end

  def bubble_sort!
    loop do
      already_sorted = true

      (0...length).each_cons(2) do |i, j|
        if yield(self[i], self[j]) > 0
          self[i], self[j] = self[j], self[i]
          already_sorted = false
        end
      end

      break if already_sorted
    end

    self
  end
end
