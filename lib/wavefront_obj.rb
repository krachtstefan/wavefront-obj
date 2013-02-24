require 'rubygems'
require 'digest/md5'

class WavefrontObj

  attr_reader :point_index
  attr_accessor :name, :points, :faces, :verbose
  
  DEFAULT_NAME = "Wavefront Obj"
  
	def initialize
		@verbose = false
		@name = DEFAULT_NAME
		@points = Hash.new
		@point_index = 0
		@faces = Hash.new
	end
  
	def add_point(pnt)
		if pnt.class == Array && pnt.length == 3
			indentifier = create_point_identifier(pnt)
			if @points[indentifier].nil?
				@points[indentifier] = Hash.new 
				@point_index = @point_index+1
				@points[indentifier]["index"] = @point_index
			end
			@points[indentifier]["point"] = pnt
			return @points[indentifier]["index"]
    else
      false
		end
	end
  
	def add_face(pnt_arr)
		face_points = []
		pnt_arr.each do |pnt|
			face_points.push add_point(pnt)
		end
		indentifier = create_face_identifier(face_points)
		if @faces[indentifier].nil?
			@faces[indentifier] = Hash.new
			@faces[indentifier]["face"] = face_points
		end
	end
  
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
  
  private
  
  def get_name_syntax(name)
  	"o #{name}"
  end

  def get_point_syntax(point)
  	"v #{point.join(" ")}"
  end

  def get_face_syntax(face)
  	"f #{face.join(" ")}"
  end

  def create_point_identifier(pnt)
  	pnt.join("|")
  end
  
  def create_face_identifier(pnts)
  	pnts.join("|")
  end

end