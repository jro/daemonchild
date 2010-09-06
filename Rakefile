# -*- ruby -*-

require 'rubygems'
require 'rake/gempackagetask'
require 'rake/testtask'
require 'rake/packagetask'
require 'rake/rdoctask'

task :default => [:test]

desc "Run tests"
task :test do
  ruby "test/test_daemonchild.rb"
end

Rake::RDocTask.new do |rd|
  rd.rdoc_dir = 'doc'
  rd.title = 'DaemonChild'
  rd.options << '--line-numbers'
  rd.options << '--inline-source'
  rd.main = "README"
  rd.rdoc_files.include("CHANGELOG","LICENSE","README","lib/*.rb")
end

# vim: syntax=ruby
