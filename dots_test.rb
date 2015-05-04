#!/usr/bin/env ruby
require_relative "dots"
require "test/unit"

class DotsTest < Test::Unit::TestCase
  def prepare
    FileUtils.rm(Dir.glob("dots/*.dot"))
    Rake.application['generate'].invoke(:how_many => 100)
  end

  def dots
    Dir.glob('dots/*').sort_by { |n| File.basename(n, '.dot').to_i }
  end

  def test_dots
    prepare
    assert_equal(dots.count, 1000)
    assert_equal(dots.first, 'dots/1.dot')
    assert_equal(dots.last, 'dots/1000.dot')
  end
end
