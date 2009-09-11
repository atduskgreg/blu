require 'test/unit'
require 'blu'

class LoadBlu < Test::Unit::TestCase
  def setup
    @b = Blu.new File.expand_path(File.dirname(__FILE__)) + "/blus/error.blu"
  end

  # def teardown
  # end

  def test_should_find_blu_file
    assert_equal( "type    square\nsustain 0.266\ndecay   0.187\nfreq    0.268\nslide   0.179\nsquare  0.326\nvibe    0.227\nvspeed  0.231", @b.instance_variable_get("@raw"))
  end
  
  def test_parse_error_blue
    @b.parse!
    assert_equal(
    {:type   => :square,
    :sustain => 0.266,
    :decay   => 0.187,
    :freq   => 0.268,
    :slide =>  0.179,
    :square =>  0.326,
    :vibe  =>  0.227,
    :vspeed =>  0.231}, @b.settings)
  end
end