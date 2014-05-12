require 'pry-byebug'

class TubeLine
  
  attr_accessor :list_all_stations 
  attr_accessor :get_start_line
  attr_accessor :get_end_line
  attr_accessor :get_start_station
  attr_accessor :get_end_station

  #1. Define suitable data structures for the underground lines and stations.
  #
  def initialize
  @victoria = ["Kings Cross", "Euston", "Warren Street", "Oxford Circus", "Green Park", "Victoria", "Pimlico"]
  
  end


  #2. Create a text-based program that prompts the user for their starting line, then prints out the stations available to choose from.
  #
  def list_all_stations(tube_line)
    tube_line.each do
      print tube_line[n]
    end
  end

  def get_start_line
    puts "Hello commuter. What line would you like to travel on?"
    @start_line = gets.strip.chomp
  end

  #3. Add code to allow the user to select a starting station.
  #
  def get_start_station
    "Which station are you starting at?"
    @start_station = gets.strip.chomp
  end

  #4. Add code to prompt the user for an ending line.
  #
  def get_end_line
    puts "What tube line will you end on?"
    @end_line = gets.strip.chomp
  end

  #5. Add code to prompt the user for an ending station.
  #
  def get_end_station
    puts "What station do you want to travel to?"
    @end_station = gets.strip.chomp
  end
  
  def tfl_journey_planner
    get_start_line
    get_start_station
    get_end_line
    get_end_station
  end
end

TubeLine.new.tfl_journey_planner
