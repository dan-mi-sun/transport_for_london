require 'pry-byebug'

class Tube

  attr_accessor :lines
  
  #1. Define suitable data structures for the underground lines and stations.
  #
  def initialize
    self.lines = { 
      
      :victoria => [:kings_cross, :euston, :warren_street, :oxford_circus, :green_park, :victoria, :pimlico], 
      
      :bakerloo => [:elephant_castle, :lambeth_north, :waterloo, :embankment, :charing_cross, :picadilly_circus, :oxford_circus, :regents_park, :baker_street], 
      
      :central => [:notting_hill_gate, :queensway, :lancaster_gate, :marble_arch, :bond_street, :oxford_circus, :tottenham_court_road, :holborn, :chancery_lane] 
    }

  end

end

class Journey
  
  attr_accessor :list_all_stations 
  attr_accessor :get_start_line
  attr_accessor :get_end_line
  attr_accessor :get_start_station
  attr_accessor :get_end_station


  #2. Create a text-based program that prompts the user for their starting line, then prints out the stations available to choose from.
  #
  def display_lines
    @lines = Tube.new.lines.keys
    @all_lines = @lines.join(", ")
    @title_list_lines = @all_lines.split.map(&:capitalize).join(" ")
    puts "You can choose from the following lines: #{@title_list_lines}"
  end

  def get_start_line
    puts "\nHello commuter. What line would you like to travel on?"
    @start = []
    @start_line = gets.strip.chomp.downcase
  end

  def list_all_stations(tube_line)
    @all_stations = Tube.new.lines[tube_line.to_sym] 
    @list_of_stations = @all_stations.join(", ")
    @print_list_of_stations = @list_of_stations.gsub("_", " ")
    @title_list_of_stations = @print_list_of_stations.split.map(&:capitalize).join(" ")
    puts "\nThese are the stations on that line: #{@title_list_of_stations}"
  end

  #3. Add code to allow the user to select a starting station.
  #
  def get_start_station
    puts "\nWhich station are you starting at?"
    @start_station = gets.strip.chomp.downcase
  end

  #4. Add code to prompt the user for an ending line.
  #
  def get_end_line
    puts "What tube line will you end on?"
    @end_line = gets.strip.chomp
  end

  #5. Add code to prompt the user for an ending station.
  #
  def get_end_station(end_line)
    puts "What station do you want to travel to?"
    @end_station = gets.strip.chomp
  end

  def tfl_journey_planner
    display_lines
    get_start_line
    list_all_stations(@start_line)
    get_start_station
    get_end_line
    get_end_station
  end

end

Journey.new.tfl_journey_planner
