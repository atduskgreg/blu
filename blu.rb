require 'rubygems'
require 'bloops'

class Blu
  SOUND_TYPES = {
    :square => Bloops::SQUARE
  }
  attr_accessor :settings
  
  def self.load(bloops, path_to_blu)
    b = Blu.new(path_to_blu)
    
    sound = bloops.sound(SOUND_TYPES[b.settings[:sound]])
    b.settings.reject!{|k,v| k == :sound}
    
    b.settings.each do |setting, value|
      sound.send("#{setting}=".to_sym, value)
    end
    
    sound
  end
  
  def initialize(path_to_blu)
    @raw = File.open(path_to_blu).read
    parse!
  end
  
  def parse!
    result = {}
    @raw.split(/\n/).each do |line| 
      words = line.split(" ");
      if ( words.first.downcase == "type")
        result[:sound] = words.last.to_sym
      else
        result[words.first.to_sym] = words.last.to_f
      end
    end
    @settings = result
  end
end