# Original data from:
# https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/parliamentaryconstituencymidyearpopulationestimates

require 'csv'

puts "#{Time.now.strftime("%d/%m/%Y %H:%M:%S")} - Creating Contituency Population Estimates"

arr_of_arrs = CSV.read(File.join(Rails.root, 'db', 'seeds', 'csv_data', '13_constituency_population_estimates.csv'))

header_row = arr_of_arrs[0]

arr_of_arrs[1,arr_of_arrs.size-1].each do |row|

  parameters_hash = {}

  # Find Constituency based on ID (column 0)
  parameters_hash[:area] = Constituency.find(row[0])
  parameters_hash[:estimate_description] = row[1]
  parameters_hash[:estimate_date] = Date.new(2015,6,1)

  # Ensure all other data is numeric
  (2..row.size-1).each do |i|
    parameters_hash[header_row[i]] = Integer(row[i].gsub(/,/, ""))
  end

  AreaPopulationEstimate.create!(parameters_hash)

end
