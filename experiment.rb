require_relative 'histogram'
require_relative 'randomise'

elements = 10.times.map { Object.new }
indexes = []

loop do
  100.times do
    randomised_elements = elements.randomise
    indexes << randomised_elements.index(elements[0])
  end

  data = indexes.group_by { |n| n }

  terminal_width = `tput cols`.to_i
  histogram = data.to_histogram(terminal_width)

  system 'clear'
  puts histogram
end
