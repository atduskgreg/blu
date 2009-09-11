class Blu
  SOUND_TYPES = %w{square}
  
  attr_accessor :settings
  
  
  def initialize(path_to_blu)
    @raw = File.open(path_to_blu).read
  end
  
  def parse!
    result = {}
    @raw.split(/\n/).each do |line| 
      words = line.split(" ");
      if ( words.first.downcase == "type")
        result[:type] = words.last.to_sym
      else
        result[words.first.to_sym] = words.last.to_f
      end
    end
    @settings = result
  end
end