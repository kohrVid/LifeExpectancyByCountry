#!/usr/bin/env ruby

require "./life_expectancy_by_country"
choice1 = nil
choice2 = nil
choice3 = nil

options = { 
  1 => { step1: "List the available countries", step2: ["", choice2, LifeExpectancyByCountry.list_of_countries]},
  2 => { step1: "Find the sum of all records on file", step2: ["", choice2, LifeExpectancyByCountry.total_records]},
  3 => { step1: "Find the highest expectancy in the world by year", step2: ["Please enter the year that you would like to collect data from:", choice2, LifeExpectancyByCountry.highest_life_expectancy_by_year(choice2) || nil]},
  4 => { step1: "Find the lowest expectancy in the world by year", step2: ["Please enter the year that you would like to collect data from:", choice2, LifeExpectancyByCountry.lowest_life_expectancy_by_year(choice2) || nil]},
  5 => { step1: "Find the region with the highest life expectancy per year", step2: ["Please enter the year that you would like to collect data from:", choice2, LifeExpectancyByCountry.region_with_highest_life_expectancy(choice2) || nil]},
  6 => { step1: "Find the region with the lowest life expectancy per year", step2: ["Please enter the year that you would like to collect data from:", choice2, LifeExpectancyByCountry.region_with_lowest_life_expectancy(choice2) || nil]},
  7 => { step1: "Find the demographic and year with the highest life expectancy", step2: ["Please enter the year that you would like to collect data from:", nil, LifeExpectancyByCountry.highest_life_expectancy_group]},
  8 => { step1: "Find the demographic and year with the lowest life expectancy", step2: ["Please enter the year that you would like to collect data from:", nil, LifeExpectancyByCountry.lowest_life_expectancy_group]},
  9 => { step1: "Find the mean life expectancy by country", step2: ["Please enter the country that you would like to collect data from:", choice2, LifeExpectancyByCountry.mean_life_by_country(choice2) || nil]},
  10=>{ step1: "Find the median life expectancy by country", step2: ["Please enter the country that you would like to collect data from:", choice2, LifeExpectancyByCountry.median_life_by_country(choice2) || nil]},
  11=>{ step1: "Find the mean life expectancy by country and year", step2: ["Please enter the country that you would like to collect data from:", choice2, nil], step3: ["Please enter the year that you would like to collect data from:", choice3, LifeExpectancyByCountry.mean_life_by_country(choice2, choice3) || nil]},
  12=>{ step1: "Find the median life expectancy by country and year", step2: ["Please enter the country that you would like to collect data from:", choice2, nil], step3: ["Please enter the year that you would like to collect data from:", choice3, LifeExpectancyByCountry.median_life_by_country(choice2, choice3) || nil]},
  13=>{ step1: "Find the mean life expectancy by gender and country", step2: ["Please enter the country that you would like to collect data from:", choice2, nil], step3: ["Please enter the gender that you would like to collect data for:", choice3, LifeExpectancyByCountry.mean_life_by_gender_and_country(choice3,choice2) || nil]},
  14=>{ step1: "Find the median life expectancy by gender and country", step2: ["Please enter the country that you would like to collect data from:", choice2, nil], step3: ["Please enter the gender that you would like to collect data for:", choice3, LifeExpectancyByCountry.median_life_by_gender_and_country(choice3,choice2) || nil]},
  15=>{ step1: "Find the international mean life expectancy", step2: ["", nil, LifeExpectancyByCountry.global_mean]},
  16=>{ step1: "Find the international median life expectancy", step2: ["", nil, LifeExpectancyByCountry.global_median]},
  17=>{ step1: "Find the international mean life expectancy by gender", step2: ["Please enter the gender that you would like to collect data for:", choice2, LifeExpectancyByCountry.global_mean_by_gender(choice2) || nil]},
  18=>{ step1: "Find the international median life expectancy by gender", step2: ["Please enter the gender that you would like to collect data for:", choice2, LifeExpectancyByCountry.global_median_by_gender(choice2) || nil]},
  19=>{ step1: "View the gaps in the collected data", step2: ["", LifeExpectancyByCountry.nil_records]}
}


puts "=====================================================\n"
puts "             Life Expectancy by Country              "
puts "=====================================================\n"

puts "Please select from the list of options below:"

options.each{|k, v| puts "#{k}. #{v[:step1]}" }
choice1 = gets.chomp.to_i
options.each do |k, v|
  puts "You have selected option ##{k}" unless choice1 != k
end



