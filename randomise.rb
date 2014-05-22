class Array
  def randomise
    dup.randomise!
  end

  def randomise!
    (length - 1).downto(1) do |i|
      j = 0.upto(i).entries.sample
      self[i], self[j] = self[j], self[i]
    end

    self
  end
end
