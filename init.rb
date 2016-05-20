#!/usr/bin/env ruby

require "./life_expectancy_by_country"

def option3
    puts "Please enter the year that you would like to collect data from:"
    choice2 = gets.chomp
    puts LifeExpectancyByCountry.highest_life_expectancy_by_year(choice2)
end

def option4
    puts "Please enter the year that you would like to collect data from:"
    choice2 = gets.chomp
    puts LifeExpectancyByCountry.lowest_life_expectancy_by_year(choice2)
end

def option5
    puts "Please enter the year that you would like to collect data from:"
    choice2 = gets.chomp
    puts LifeExpectancyByCountry.region_with_highest_life_expectancy(choice2)
end

def option6
    puts "Please enter the year that you would like to collect data from:"
    choice2 = gets.chomp
    puts LifeExpectancyByCountry.region_with_lowest_life_expectancy(choice2)
end

def option9
    puts "Please enter the country that you would like to collect data from:"
    choice2 = gets.chomp
    puts LifeExpectancyByCountry.mean_life_by_country(choice2)
end

def option10
    puts "Please enter the country that you would like to collect data from:"
    choice2 = gets.chomp
    puts LifeExpectancyByCountry.median_life_by_country(choice2)
end

def option11
    puts "Please enter the country that you would like to collect data from:"
    choice2 = gets.chomp
    puts LifeExpectancyByCountry.mean_life_by_country(choice2)
end

def option12
    puts "Please enter the country that you would like to collect data from:"
    choice2 = gets.chomp
    puts LifeExpectancyByCountry.median_life_by_country(choice2)
end

def option13
    puts "Please enter the country that you would like to collect data from:"
    choice2 = gets.chomp
    puts "Please enter the gender that you would like to collect data for:"
    choice3 = gets.chomp
    puts LifeExpectancyByCountry.mean_life_by_gender_and_country(choice3,choice2)
end

def option14
    puts "Please enter the country that you would like to collect data from:"
    choice2 = gets.chomp
    puts "Please enter the gender that you would like to collect data for:"
    choice3 = gets.chomp
    puts LifeExpectancyByCountry.median_life_by_gender_and_country(choice3,choice2)
end

def option17
    puts "Please enter the gender that you would like to collect data for:"
    choice2 = gets.chomp
    puts LifeExpectancyByCountry.global_mean_by_gender(choice2)
end

def option18
    puts "Please enter the gender that you would like to collect data for:"
    choice2 = gets.chomp
    puts LifeExpectancyByCountry.global_median_by_gender(choice2)
end

options = { 
  1 => { step1: ["List the available countries", Proc.new { puts LifeExpectancyByCountry.list_of_countries }]},
  2 => { step1: ["Find the sum of all records on file", Proc.new { puts LifeExpectancyByCountry.total_records }]},
  3 => { step1: ["Find the highest expectancy in the world by year", method(:option3)]},
  4 => { step1: ["Find the lowest expectancy in the world by year", method(:option4)]},
  5 => { step1: ["Find the region with the highest life expectancy by year", method(:option5)]},
  6 => { step1: ["Find the region with the lowest life expectancy by year", method(:option6)]},
  7 => { step1: ["Find the demographic and year with the highest life expectancy", Proc.new { LifeExpectancyByCountry.highest_life_expectancy_group }]},
  8 => { step1: ["Find the demographic and year with the lowest life expectancy", Proc.new { puts LifeExpectancyByCountry.lowest_life_expectancy_group }]},
  9 => { step1: ["Find the mean life expectancy by country", method(:option9)]},
  10=>{ step1: ["Find the median life expectancy by country", method(:option10)]},
  11=>{ step1: ["Find the mean life expectancy by country and year", method(:option11)]},
  12=>{ step1: ["Find the median life expectancy by country and year", method(:option12)]},
  13=>{ step1: ["Find the mean life expectancy by gender and country", method(:option13)]},
  14=>{ step1: ["Find the median life expectancy by gender and country", method(:option14)]},
  15=>{ step1: ["Find the international mean life expectancy", Proc.new { puts LifeExpectancyByCountry.global_mean }]},
  16=>{ step1: ["Find the international median life expectancy", Proc.new { puts LifeExpectancyByCountry.global_median }]},
  17=>{ step1: ["Find the international mean life expectancy by gender", method(:option17)]},
  18=>{ step1: ["Find the international median life expectancy by gender", method(:option18)]},
  19=>{ step1: ["Print all rows of data to a file", Proc.new { puts LifeExpectancyByCountry.print_to_file(LifeExpectancyByCountry.read_data) }]},
  20=>{ step1: ["View the gaps in the collected data", Proc.new { puts LifeExpectancyByCountry.nil_records }]}
}


puts "=====================================================\n"
puts "             Life Expectancy by Country              "
puts "=====================================================\n"

puts "Please select from the list of options below:\n"

options.each{|k, v| puts "#{k}. #{v[:step1][0]}" }
puts 'Press "q" to quit, "h" to return home'
choice1 = gets.chomp.to_i
options.each do |k, v|
  if choice1 == k
    puts "You have selected option ##{k}"
    v[:step1][1].call
  elsif choice1 =="h"
    #also fix later
  end
  #break if choice1 == "q"
end

