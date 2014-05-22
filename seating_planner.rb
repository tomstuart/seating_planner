require 'csv'
require_relative 'randomise'

class Person < Struct.new(:name, :ticket_type)
  def to_s
    "#{name} (#{ticket_type})"
  end

  def speaker?
    ticket_type == 'Speaker'
  end
end

speakers, attendees = CSV.foreach('people.csv').
  map { |fields| Person.new(*fields) }.
  partition(&:speaker?)

people = speakers.randomise + attendees.randomise


class Table
  attr_accessor :number, :capacity, :people

  def initialize(number:, capacity:)
    self.number = number
    self.capacity = capacity
    self.people = []
  end

  def has_a_free_seat?
    people.size < capacity
  end

  def add_person(person)
    raise unless has_a_free_seat?
    people << person
  end
end

tables =
  (1..3).map { |n| Table.new(number: n, capacity: 12) } +
  (4..11).map { |n| Table.new(number: n, capacity: 8) }

# TODO randomise table order
table_order = tables.randomise.cycle


unseated_people = []

people.each do |person|
  if tables.none?(&:has_a_free_seat?)
    unseated_people << person
  else
    begin
      table = table_order.next
    end until table.has_a_free_seat?

    table.add_person(person)
  end
end

tables.each do |table|
  puts "Table #{table.number}:"
  table.people.each do |person|
    puts "  * #{person}"
  end
  puts
end

if unseated_people.any?
  puts "Unseated:"
  unseated_people.each do |person|
    puts "  * #{person}"
  end
end
