require './helper.rb'

describe WavefrontObj do
  
  before do
    @wavefront_obj = WavefrontObj.new
  end
        
  it "has to provide a name setter and getter" do
    @wavefront_obj.name = "Test"
    @wavefront_obj.name.must_equal "Test"
  end

end