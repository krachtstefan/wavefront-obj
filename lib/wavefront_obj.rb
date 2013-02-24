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
  private

  def create_point_identifier(pnt)
  	pnt.join("|")
  end


end