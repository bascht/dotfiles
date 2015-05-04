#!/usr/bin/env ruby
# encoding: utf-8

require 'rake'

task :generate do |task, args|
  how_many = args[:how_many] || 1000
  (1..how_many).each do |it|
     open("dots/#{it}.dot", "w") do |f|
       f.write('.' * it)
     end
  end
end
