require 'rake'
require 'rake/testtask'

require_relative 'dots'

task :default => :generate

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['*test.rb']
  t.verbose = true
end
