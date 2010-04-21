require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "FractionParser" do

  def should_parse_fraction(string, float)
    fp = FractionParser.parse(string)
    fp.to_f.should eql(float)
  end

  it "should parse fractions" do
    should_parse_fraction("3/4", 0.75)
    should_parse_fraction("2 1/16", 2.0625)
    should_parse_fraction("8", 8.0)
    should_parse_fraction("8.25", 8.25)
  end

  it "should otherwise just convert to a float" do
    should_parse_fraction("2.0 3/4", 2.0)
    should_parse_fraction("2 3 /4", 2.0)
  end

end