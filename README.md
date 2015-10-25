# Amazer
A maze generator and solver using recursive backtracker algorithm

[![Code Climate](https://codeclimate.com/github/faheemmughal/amazer/badges/gpa.svg)](https://codeclimate.com/github/faheemmughal/amazer)
[![Test Coverage](https://codeclimate.com/github/faheemmughal/amazer/badges/coverage.svg)](https://codeclimate.com/github/faheemmughal/amazer/coverage)

##### Installation & Execution

* Get all dependecies: `bundle`
* Run tests: `rspec`
* Run: `./bin/amaze_me [width height]`


##### Project Layout

* bin/*  : Executables
* lib/*.rb : Source files
* spec/*_spec.rb : test files


##### Note

Note: It's a memory intensive solution. A big enough maze will overflow the stack. It can also be solved using an iterative approach and a manual stack of visited nodes, with enough time on hand.


##### Reading & Inspiration

* https://en.wikipedia.org/wiki/Maze_generation_algorithm#Recursive_backtracker
* https://en.wikipedia.org/wiki/Maze_solving_algorithm#Recursive_algorithm
* http://www.jamisbuck.org/presentations/rubyconf2011/index.html
* http://weblog.jamisbuck.org/2010/12/27/maze-generation-recursive-backtracking.html
