require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array

  holiday_supplies[:summer][:fourth_of_july][1]

end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays

  holiday_hash.each do |season,data|
    data.each {|holiday,supply_array| supply_array<<supply if season==:winter}
    #if season==:winter
      #data.each do |holiday,supply_array|
          #supply_array<<supply
      #end
    #end
  end

  #Cheating method below
  #holiday_supplies[:winter][:christmas][2]=supply
  #holiday_supplies[:winter][:new_years][1]=supply

end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array

  holiday_hash.each do |season,data|
    data.each {|holiday,supply_array| supply_array<<supply if holiday==:memorial_day}
    #data.each do |holiday, supply_array|
      #if holiday==:memorial_day
        #supply_array<<supply
      #end
    #end
  end

  #Cheating method below
  #holiday_supplies[:spring][:memorial_day][1]=supply

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash

  holiday_hash[season][holiday_name]=supply_array

  holiday_hash

end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season

  holiday_hash[:winter].values.flatten

end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

  holiday_hash.each do |season,data|
    puts "#{season.to_s.capitalize}:"
    data.each do |holiday,supply_array|
      #consolidated the following lines of code in line #109-
      #holiday_array=holiday.to_s.split("_")
      #holiday_capitalized = holiday_array.collect do |word|

      #holiday was a symbol (eg :christmas)
      #is it okay to change it to string then an array?
      #This does make the code cleaner without creating new variables
      #to temporarily hold data

      #holiday_capitalized = holiday.to_s.split("_").collect do |word|

      #I guess you can't convert holiday from symbol to string,
      #then split the string to an array, collect the valentines_day_supplies
      #from word.capitalize and then join the array into a string again
      #all in one line. Oh well.
      #holiday=holiday.to_s.split("_").collect.join(" ") do |word|

      holiday=holiday.to_s.split("_").collect {|word| word.capitalize}
          #word.capitalize
      #end

      #puts "  #{holiday_capitalized.join(" ")}: #{supply_array.join(", ")}"
      #puts "  #{holiday}: #{supply_array.join(", ")}"
      puts "  #{holiday.join(" ")}: #{supply_array.join(", ")}"

    end
  end


end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_holidays=[]

  holiday_hash.each do |season,data|
    data.each do |holiday,supply_array|
      supply_array.each {|supply| bbq_holidays<<holiday if supply=="BBQ"}
        #if supply=="BBQ"
          #bbq_holidays<<holiday
        #end
      #end
    end
  end
  bbq_holidays
end
