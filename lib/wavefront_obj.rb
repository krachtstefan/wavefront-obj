require 'rubygems'
require 'digest/md5'

# @author Stefan Kracht
class WavefrontObj

  attr_reader :point_index
  attr_accessor :name, :points, :faces
  
  # dependency injectors
  attr_writer :file
  
  DEFAULT_NAME = "Wavefront Obj"
  
  # inits attributes
	def initialize
		@name = DEFAULT_NAME
		@points = Hash.new
		@point_index = 0
		@faces = Hash.new
	end

  # adds a point to the 3d object 
  # @param pnt [Array] array of 3 coordinates
  # @return [String, false] the point index
	def add_point(pnt)
    # TODO add error handling
		indentifier = create_point_identifier(pnt)
		if @points[indentifier].nil?
			@points[indentifier] = Hash.new 
			@point_index = @point_index+1
			@points[indentifier]["index"] = @point_index
		end
		@points[indentifier]["point"] = pnt
		return @points[indentifier]["index"]
	end
  
  # adds a face to the 3d object 
  # @param pnt_arr [Array] array of multiple point arrays
  # @return [true]
	def add_face(pnt_arr)
    # TODO add error handling
		face_points = []
		pnt_arr.each do |pnt|
			face_points.push add_point(pnt)
		end
		indentifier = create_face_identifier(face_points)
		if @faces[indentifier].nil?
			@faces[indentifier] = Hash.new
			@faces[indentifier]["face"] = face_points
		end
    return true
	end
    
  # returns the raw data of the obj file
  # @return [String] raw data
	def get_raw_data
		buffer = []
		buffer.push(get_name_syntax(@name))

		@points.each do |key, pnt|
			buffer.push(get_point_syntax(pnt["point"]))
		end

		@faces.each do |key, face|
			buffer.push(get_face_syntax(face["face"]))
		end

		return buffer.join("\n")
  end

  # stores the obj data as a file
  # @param path [String] path to store the file, ".obj" will be added if missing
  # @return [String] the path of the created file
  def save(path)
    # TODO add error handling
    raw_data = get_raw_data
    path = "#{path}.obj" unless path.split(".").last == "obj"
    file.open(path, 'w') {|f| f.write(get_raw_data) }
    path
  end
  
  private
  
  # injectable dependencies for file
  # @return [void]
  def file
    @file || File
  end
  
  # returns the syntax of object definition
  # @param name [String] object name
  # @return [String] object name in .obj format
  def get_name_syntax(name)
  	"o #{name}"
  end

  # returns the syntax of a point definition
  # @param point [String] object name
  # @return [String, false] point in .obj format
  def get_point_syntax(point)
    # TODO convert to array
  	"v #{point.join(" ")}"
  end

  # returns the syntax of a face definition
  # @return [String, false] face in .obj format
  def get_face_syntax(face)
    # TODO convert to array
  	"f #{face.join(" ")}"
  end
  
  # generates the unique id of a point
  # @return [String] point indetifier
  def create_point_identifier(pnt)
    # TODO convert to array
    Digest::MD5.hexdigest(pnt.join("|"))
  end

  # generates the unique id of a face
  # @return [String] face indetifier  
  def create_face_identifier(pnts)
    # TODO convert to array
    Digest::MD5.hexdigest(pnts.join("|"))
  end

end