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

  def self.display_lines
    lines = Tube.new.lines.keys
    all_lines = lines.join(", ")
    title_list_lines = all_lines.split.map(&:capitalize).join(" ")
    puts "\nYou can choose from the following lines: #{title_list_lines}"
  end

end

class Station
  
  def self.list_all_stations(tube_line)
    all_stations = Tube.new.lines[tube_line.to_sym] 
    list_of_stations = all_stations.join(", ")
    print_list_of_stations = list_of_stations.gsub("_", " ")
    title_list_of_stations = print_list_of_stations.split.map(&:capitalize).join(" ")
    puts "\nThese are the stations on that line: \n\n#{title_list_of_stations}"
  end

end

class Journey
  
  attr_accessor :list_all_stations 

  #2. Create a text-based program that prompts the user for their starting line, then prints out the stations available to choose from.
  #
  def get_start_line
    puts "\nHello commuter. What line would you like to travel on?"
    @start_line = gets.strip.chomp.downcase
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
    @end_line = gets.strip.chomp.downcase
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

    start_station_sym = @start_station.gsub(" ", "_").to_sym

    end_station_sym = @end_station.gsub(" ", "_").to_sym

    start_line_sym = @start_line.to_sym

    end_line_sym = @end_line.to_sym
    
    if start_line_sym == :victoria
      start_line_sym_index = 0
    elsif start_line_sym == :bakerloo
      start_line_sym_index = 0
    elsif start_line_sym == :central
      start_line_sym_index = 0
    end

    stations_on_start_line = Tube.new.lines.values_at(start_line_sym)
    stations_on_end_line = Tube.new.lines.values_at(end_line_sym)
    
    stations_start = stations_on_start_line[start_line_sym_index]

    start_index = stations_start.find_index(start_station_sym) 

    if start_line_sym != end_line_sym

      intersection = (stations_on_start_line[0] & stations_on_end_line[0])[0] 

      start_int_index = stations_on_start_line[0].index(intersection)
      stops_between = (start_index.to_i - start_int_index.to_i).abs 

      end_index = stations_on_end_line[0].find_index(end_station_sym)

      end_int_index = stations_on_end_line[0].index(intersection)
      between = (end_index.to_i - end_int_index.to_i).abs

      stations_on_first = stations_on_start_line[0][start_index, (start_int_index - 1)]
      stations_on_second = stations_on_end_line[0][end_int_index, (end_index + 1)]

      number_of_stops = (end_index - start_index).abs

      puts "\nThere are #{number_of_stops} stations till your final destination"

      stations_en_route = stations_on_first + stations_on_second
      
      print_stations_en_route = stations_en_route.join(", ").gsub("_", " ").split.map(&:capitalize).join(" ")

      puts "\nThe stations en route are #{print_stations_en_route}"

    else

      end_index = stations_start.find_index(end_station_sym)

      number_of_stops = ((end_index.to_i - start_index.to_i).abs + 1)

      puts "\nThere are #{number_of_stops} stations till your final destination"
      #Use indexes to print stations between and including
      #
      stations_en_route = stations_start.slice(start_index..end_index)
      #Generate list and make print print ready
      #
      print_stations_en_route = stations_en_route.join(", ").gsub("_", " ").split.map(&:capitalize).join(" ")

      puts "\nThe stations en route are #{print_stations_en_route}"

    end
  end

  #6. Print out the number of stops between the two stations.
  #

  def tfl_journey_planner
    Tube.display_lines
    get_start_line
    Station.list_all_stations(@start_line)
    get_start_station
    Tube.display_lines
    get_end_line
    get_end_station
    print_stations_en_route
  end

end

Journey.new.tfl_journey_planner
