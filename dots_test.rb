#!/usr/bin/env ruby
require_relative "dots"
require "test/unit"

class DotsTest < Test::Unit::TestCase
  def prepare
    FileUtils.rm(Dir.glob("dots/*.dot"))
    Rake.application['generate'].execute(how_many: 100)
  end

  def dots
    Dir.glob('dots/*').sort_by { |n| File.basename(n, '.dot').to_i }
  end

  def test_dots
    prepare
    assert_equal(dots.count, 100)
    assert_equal(dots.first, 'dots/001.dot')
    assert_equal(dots.last, 'dots/100.dot')
  end
end
