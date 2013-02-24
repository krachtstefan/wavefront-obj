require './helper.rb'

describe WavefrontObj do
  
  before do
    @wavefront_obj = WavefrontObj.new
  end
  
  it "has to have a points Hash" do
    @wavefront_obj.points.must_be_kind_of Hash
  end

  it "has to have a faces Hash" do
    @wavefront_obj.faces.must_be_kind_of Hash
  end  

  it "has to have a point index at 0" do
    @wavefront_obj.point_index.must_equal 0
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
    
    it "has to have a point with index key" do
      @wavefront_obj.points.values.first["index"].must_be_kind_of Fixnum
    end

    it "has to have a point with point key" do
      @wavefront_obj.points.values.first["point"].must_be_kind_of Array
    end
          
    describe "when adding the same point again" do
      
      before do
        @wavefront_obj.add_point [1, 2, 3]
      end

      it "still has to have point index at 1" do
        @wavefront_obj.point_index.must_equal 1
      end
      
      it "still has to have 1 point" do
        @wavefront_obj.points.length.must_equal 1
      end
      
    end

  end
  
  describe "when adding a triangle face" do
    
    before do
      @wavefront_obj.add_face [[0, 0, 0],[1, 0, 0],[1, 1, 0]]
    end
    
    it "has to be in the faces array" do
      @wavefront_obj.faces.length.must_equal 1
    end
    
    it "has to have a face with face key" do
      @wavefront_obj.faces.values.first["face"].must_be_kind_of Array
    end
    
    describe "when adding the same face again" do
      before do
        @wavefront_obj.add_face [[0, 0, 0],[1, 0, 0],[1, 1, 0]]
      end
            
      it "still has to have 1 face" do
        @wavefront_obj.faces.length.must_equal 1
      end
      
    end
    
  end
  
  describe "requesting the raw data" do
        
    it "should return a string" do
      @wavefront_obj.add_face [[0, 0, 0],[1, 0, 0],[1, 1, 0]]
      @wavefront_obj.get_raw_data.must_be_kind_of String
    end
        
  end

end