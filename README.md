wavefront-obj
=============

#### Description

Ruby library to create wavefront .obj files.

This library provides a handy interface to create [wavefront .obj files](http://en.wikipedia.org/wiki/Wavefront_.obj_file). You can add vertex and faces to define a 3d object. It handles the syntax of the .obj file format and takes care of vertex definition (no vertex is defined twice which reduces filesize). You can access the result in raw data or write it into a file.

Obj-Files can be used to feed a 3d printer.

#### Usage

install

	gem install wavefront-obj	

require library, create an object and give it a name

	require 'wavefront_obj'
	cube = WavefrontObj.new
	cube.name = "my awesome cube"

add faces

	cube.add_face [[1, -1, -1],[1, -1, 1],[-1, -1, 1],[-1, -1, -1]]
	cube.add_face [[1, 1, -1],[-1, 1, -1],[-1, 1, 1],[1, 1, 1]]
	cube.add_face [[1, -1, -1],[1, 1, -1],[1, 1, 1],[1, -1, 1]]
	cube.add_face [[1, -1, 1],[1, 1, 1],[-1, 1, 1],[-1, -1, 1]]
	cube.add_face [[-1, -1, 1],[-1, 1, 1],[-1, 1, -1],[-1, -1, -1]]
	cube.add_face [[1, 1, -1],[1, -1, -1],[-1, -1, -1],[-1, 1, -1]]

access the raw data

	puts cube.get_raw_data

which will look like this

	o my awesome cube
	v 1 -1 -1
	v 1 -1 1
	v -1 -1 1
	v -1 -1 -1
	v 1 1 -1
	v -1 1 -1
	v -1 1 1
	v 1 1 1
	f 1 2 3 4
	f 5 6 7 8
	f 1 5 8 2
	f 2 8 7 3
	f 3 7 6 4
	f 5 1 4 6

or save it as a file. You can open .obj files with most 3d programs like blender or some newer Photoshop versions as well.

	cube.save "my_awesome_cube.obj"


## Version History
**v1.0.0** 02/25/2013

- initial release (yanked)

**v1.0.1** 02/25/2013

- renamed _export\_obj\_path_ method to _save_

**v1.0.2** 03/02/2013

- make _add\_face_ method return _true_ instead of _void_
- added dependency injection to mock ruby file class
- added test for save method 
- added yard documentation
- updated _README.md_ - Fixed some typos, adjust structure, added version history