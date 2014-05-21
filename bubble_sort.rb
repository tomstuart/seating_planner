class Array
  def bubble_sort(&block)
    clone.bubble_sort!(&block)
  end

  def bubble_sort!
    length.downto(1).each do |finish|
      (0...finish).each_cons(2) do |i, j|
        if yield(self[i], self[j]) > 0
          self[i], self[j] = self[j], self[i]
        end
      end
    end

    self
  end
end
