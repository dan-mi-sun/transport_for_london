class TubeLine
  
  attr_accessor :station

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

  def begin_program
    puts "Hello commuter. What line would you like to travel on?"
  end
end
