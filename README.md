wavefront-obj
=============

Ruby library to create wavefront .obj files.

This library provides a handy interface to create wavefront .obj files. You can add vertex and faces to define a 3d object. It handles the syntax of the .obj file format and takes care of vertex definition (no vertex is defined twice which reduces filesize). You can access the result in raw data or write it into a file.