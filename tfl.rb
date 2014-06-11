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

  #Which methods are specific to the Tube?
  #display_lines

end

class Station
  
  # def station_name_to_sym(station)
  #   station.gsub("_", " ").to_sym
  # end
  # What methods are specific to a station?
  # list_all_stations
  #

end

class Journey
  
  attr_accessor :list_all_stations 

  #2. Create a text-based program that prompts the user for their starting line, then prints out the stations available to choose from.
  #
  def display_lines
    lines = Tube.new.lines.keys
    all_lines = lines.join(", ")
    title_list_lines = all_lines.split.map(&:capitalize).join(" ")
    puts "\nYou can choose from the following lines: #{title_list_lines}"
  end

  def get_start_line
    puts "\nHello commuter. What line would you like to travel on?"
    @start_line = gets.strip.chomp.downcase
  end

  def list_all_stations(tube_line)
    all_stations = Tube.new.lines[tube_line.to_sym] 
    list_of_stations = all_stations.join(", ")
    print_list_of_stations = list_of_stations.gsub("_", " ")
    title_list_of_stations = print_list_of_stations.split.map(&:capitalize).join(" ")
    puts "\nThese are the stations on that line: \n\n#{title_list_of_stations}"
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
    puts "\nWhat tube line will you end on?"
    end_line = gets.strip.chomp.downcase
  end

  #5. Add code to prompt the user for an ending station.
  #
  def get_end_station
    puts "\nWhich station is your end destination?"
    @end_station = gets.strip.chomp.downcase
  end
    
    #7. Print out the actual station stops between the two stations on the screen.
    #
  def print_stations_en_route
    #get start station, get end station, create an array with these stations and stations between, print length of array 
    #Using the start staion value I want to get the index of hash array
    #
    start_station_sym = @start_station.gsub(" ", "_").to_sym
    #Using the end staion value I want to get the index of hash array
    #
    end_station_sym = @end_station.gsub(" ", "_").to_sym
    #convert line to sym
    #
    start_line_sym = @start_line.to_sym
    #Return an array for selected line:
    #
    two_d_array_of_stations_on_start_line = Tube.new.lines.values_at(start_line_sym)
    if start_line_sym == :victoria
      start_line_sym_index = 0
    end
    one_d_array_of_stations = two_d_array_of_stations_on_start_line[start_line_sym_index]
    #Use start station symbol to find index of station
    #
    start_index = one_d_array_of_stations.find_index(start_station_sym) 
    #Use end station symbol to find index of station
    #
    end_index = one_d_array_of_stations.find_index(end_station_sym)
    #Use index of start and finish to calculate number of stops en route
    #
    number_of_stops = ((end_index.to_i - start_index.to_i) + 1)

    puts "\nThere are #{number_of_stops} stations till your final destination"
    #Use indexes to print stations between and including
    #
    stations_en_route = one_d_array_of_stations.slice(start_index..end_index)
    #Generate list and make print print ready
    #
    print_stations_en_route = stations_en_route.join(", ").gsub("_", " ").split.map(&:capitalize).join(" ")

    puts "\nThe stations en route are #{print_stations_en_route}"
    
  end

    #6. Print out the number of stops between the two stations.
    #
    def calculate_number_stops
    end

  def tfl_journey_planner
    display_lines
    get_start_line
    list_all_stations(@start_line)
    get_start_station
    display_lines
    get_end_line
    get_end_station
    print_stations_en_route
  end

end

Journey.new.tfl_journey_planner
