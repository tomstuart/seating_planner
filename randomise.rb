class Array
  def randomise
    sort { [-1, 1].sample }
  end
end
