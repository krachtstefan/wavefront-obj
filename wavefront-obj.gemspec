Gem::Specification.new do |s|
  s.name              = 'wavefront-obj'
  s.version           = '1.0.2'
  s.date              = '2013-02-25'
  s.summary           = "Ruby library to create wavefront obj files"
  s.description       = "This library provides a handy interface to create wavefront .obj files. You can add vertex and faces to define a 3d object. It handles the syntax of the .obj file format and takes care of vertex definition (no vertex is defined twice which reduces filesize). You can access the result in raw data or write it into a file."
  s.authors           = ["Stefan Kracht"]
  s.email             = "stefankracht@gmail.com"
  s.files             = ["lib/wavefront_obj.rb"]
  s.homepage          = "https://github.com/krachtstefan/wavefront-obj"
  s.extra_rdoc_files  = ['README.md']
end