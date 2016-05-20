require "pry"
require "csv"
class LifeExpectancyByCountry
  COLUMNS = [:GHO, :Indicator, :PUBLISHSTATE, :PUBLISH_STATES, :YEAR, :Year,
	     :REGION, :WHO_region, :COUNTRY, :Country, :SEX, :Sex,
	     :Display_Value, :Numeric_Value, :Low_Value, :High_Value, :Comments] 
  attr_accessor *COLUMNS

  def self.read_data
    data = CSV.read("./life-expectancy-by-country-at-birth.csv")
    records = []
    data.shift
    data.each do |row|
      life_expectancy_by_country = LifeExpectancyByCountry.new

      COLUMNS.each_with_index do |name, idx|
        life_expectancy_by_country.instance_variable_set("@" + name.to_s, row[idx])
      end
      records << life_expectancy_by_country
    end
    records.select!{|i| i.GHO == "WHOSIS_000001"}
  end

  def self.list_of_countries
    self.read_data.map(&:Country).uniq
  end

  def self.total_records
    self.read_data.size
  end

  #using averages for both genders
  def self.highest_life_expectancy_by_year(year)
    data = LifeExpectancyByCountry.read_data
    group = data.select{|i| i.Year == year.to_s && i.Sex = "Both sexes"}
      .sort_by{|i| i.Numeric_Value.to_f}.last
    return "#{group.Numeric_Value}/#{group.Country}"
  end
  
  def self.lowest_life_expectancy_by_year(year)
    data = self.read_data
    group = data.select{|i| i.Year == year.to_s && i.Sex = "Both sexes"}
      .sort_by{|i| i.Numeric_Value.to_f}.first
    return "#{group.Numeric_Value}/#{group.Country}"
  end
  
  def self.region_with_highest_life_expectancy(year)
    data = self.read_data
    group = data.select{|i| i.Year == year.to_s && i.Sex = "Both sexes"}
      .sort_by{|i| i.Numeric_Value.to_f}.last
    return group.WHO_region
  end
  
  def self.region_with_lowest_life_expectancy_by_year(year)
    data = self.read_data
    group = data.select{|i| i.Year == year.to_s && i.Sex = "Both sexes"}
      .sort_by{|i| i.Numeric_Value.to_f}.first
    return group.WHO_region
  end

  def self.nil_records
    data = self.read_data
    group = data.select{|i| i.Numeric_Value.to_f.nil? }.last
    return group
  end

  def self.highest_life_expectancy_group
    data = self.read_data
    group = data.sort_by{|i| i.Numeric_Value.to_f}.last
    return "#{group.Numeric_Value}/#{group.Sex}/#{group.Country}/#{group.Year}"
  end

  def self.lowest_life_expectancy_group
    data = self.read_data
    group = data.sort_by{|i| i.Numeric_Value.to_f}.first
    return "#{group.Numeric_Value}/#{group.Sex}/#{group.Country}/#{group.Year}"
  end


  #The means are calculated by dividing the total age by the number of records 
  #available for life expectancy at birth.
  def self.mean_life_by_country(country)
    data = self.read_data
    life_expectancy = data.select{|record| record.Country == country}
      .map(&:Numeric_Value)  
    return life_expectancy.map(&:to_i).reduce(:+) / life_expectancy.size
  end
  
  def self.median_life_by_country(country)
    data = self.read_data
    life_expectancy = data.select{|record| record.Country == country}
      .map(&:Numeric_Value)  
    sorted = life_expectancy.map(&:to_i).sort
    middle = life_expectancy.size / 2
    return life_expectancy.size.odd? ? sorted[middle] : 0.5*(sorted[middle] + sorted[middle - 1])
  end
  
  def self.mean_life_by_country_and_year(country, year)
    data = self.read_data
    life_expectancy = data.select{|record| record.Country == country && record.Year == year}
      .map(&:Numeric_Value)  
    return life_expectancy.map(&:to_i).reduce(:+) / life_expectancy.size
  end
  
  def self.median_life_by_country(country, year)
    data = self.read_data
    life_expectancy = data.select{|record| record.Country == country && record.Year == year}
      .map(&:Numeric_Value)  
    sorted = life_expectancy.map(&:to_i).sort
    middle = life_expectancy.size / 2
    return life_expectancy.size.odd? ? sorted[middle] : 0.5*(sorted[middle] + sorted[middle - 1])
  end
  
  def self.mean_life_by_gender_and_country(gender,country)
    data = self.read_data
    life_expectancy = data.select{|record| record.Sex == gender && record.country == country}
      .map(&:Numeric_Value)  
    return life_expectancy.map(&:to_i).reduce(:+) / life_expectancy.size
  end
  
  def self.median_life_by_gender_and_country(gender, country)
    data = self.read_data
    life_expectancy = data.select{|record| record.Sex == gender && record.country == country}
      .map(&:Numeric_Value)
    sorted = life_expectancy.map(&:to_i).sort
    middle = life_expectancy.size / 2
    return life_expectancy.size.odd? ? sorted[middle] : 0.5*(sorted[middle] + sorted[middle - 1])
  end

  def self.global_mean
    data = self.read_data
    life_expectancy = data.select{|record| record.Sex == "Both sexes"}.map(&:Numeric_Value)  
    return life_expectancy.map(&:to_i).reduce(:+) / life_expectancy.size
  end

  def self.global_median
    data = self.read_data
    life_expectancy = data.select{|record| record.Sex == "Both sexes"}.map(&:Numeric_Value)  
    sorted = life_expectancy.map(&:to_i).sort
    middle = life_expectancy.size / 2
    return life_expectancy.size.odd? ? sorted[middle] : 0.5*(sorted[middle] + sorted[middle - 1])
  end

  def self.global_mean_by_gender(gender)
    data = self.read_data
    life_expectancy = data.select{ |record| record.Sex == "Both sexes" }.map(&:Numeric_Value)  
    return life_expectancy.map(&:to_i).reduce(:+) / life_expectancy.size
  end
  
  def self.global_median_by_gender(gender)
    data = self.read_data
    life_expectancy = data.select{ |record| record.Sex == "Both sexes" }.map(&:Numeric_Value)
    sorted = life_expectancy.map(&:to_i).sort
    middle = life_expectancy.size / 2
    return life_expectancy.size.odd? ? sorted[middle] : 0.5*(sorted[middle] + sorted[middle - 1])
  end

end
