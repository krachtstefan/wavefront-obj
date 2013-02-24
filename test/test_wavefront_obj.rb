require './helper.rb'

describe WavefrontObj do
  
  before do
    @wavefront_obj = WavefrontObj.new
  end
        
  it "has to provide a name setter and getter" do
    @wavefront_obj.name = "Test"
    @wavefront_obj.name.must_equal "Test"
  end
  
  describe "when adding a point" do
    before do
      @wavefront_obj.add_point [1, 2, 3]
    end
    
    it "has to be in the points array" do
      @wavefront_obj.points.length.must_equal 1
    end
    
    it "has to incremebt the point index" do
      @wavefront_obj.point_index.must_equal 1
    end
      
    describe "when adding the same point again" do
      before do
        @wavefront_obj.add_point [1, 2, 3]
      end

      it "still has to be a point index 1" do
        @wavefront_obj.point_index.must_equal 1
      end
      
      it "still has to have one point" do
        @wavefront_obj.points.length.must_equal 1
      end
    end
      
    
    
    # check keys
  end

end