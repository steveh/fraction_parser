require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "FractionParser" do

  def should_parse(string, float)
    FractionParser.parse(string).to_f.should eql(float)
  end

  it "should parse fractions" do
    should_parse("3/4", 0.75)
    should_parse("2 1/16", 2.0625)
    should_parse("8", 8.0)
    should_parse("8.25", 8.25)
  end

  it "should otherwise just convert to a float" do
    should_parse("2.0 3/4", 2.0)
    should_parse("2 3 /4", 2.0)
  end

end