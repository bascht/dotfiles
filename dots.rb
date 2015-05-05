#!/usr/bin/env ruby
# encoding: utf-8

require 'rake'

task :generate do |task, args|
  how_many = args[:how_many] || 1000
  (1..how_many).each do |it|
    name = "%0#{how_many.to_s.length}d" % it
    open("dots/#{name}.dot", "w") do |f|
      f.write('.' * it)
    end
  end
end
