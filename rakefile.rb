#!/usr/bin/env rake
# coding: utf-8

require 'rake/testtask'
require "bundler/gem_tasks"

Rake::TestTask.new do |t|
  t.test_files = ['tests/in_array_test.rb']
  t.verbose = false
  t.warning = true
end

desc "Run a scan for smelly code!"
task :reek do |t|
  `reek --no-color lib > reek.txt`
end

desc "Fire up an IRB session with in_array preloaded."
task :console do
  system "ruby irbt.rb local"
end

desc "What version of in_array is this?"
task :vers do |t|
  puts
  puts "in_array version = #{InArray::VERSION}"
end
