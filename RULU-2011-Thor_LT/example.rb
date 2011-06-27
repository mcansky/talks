#!/bin/env ruby

require "rubygems"
require "bundler/setup"

# get all the gems in
Bundler.require(:default)

class Example < Thor

  include Thor::Actions
  no_tasks do
    def something
      puts "something !"
    end
  end
  
  desc "example", "say stuff"
  method_options :old => false
  method_option :name, :type => :string, :required => true
  def example
    say "#{options[:name]} you are old !", :red if options[:old]
    say "hello #{options[:name]}", :green unless options[:old]
    something
  end
end

Example.start
