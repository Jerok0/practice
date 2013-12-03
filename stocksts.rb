require_relative "csvreader.rb"

reader = Csvreader.new
ARGV.each do |file|
  puts "File: #{file}"
  reader.read file
end
puts reader.total_value