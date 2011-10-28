#!/usr/bin/env ruby

require File.expand_path(File.join File.dirname(__FILE__), "scanr.rb")
require File.expand_path(File.join File.dirname(__FILE__), "inPut.rb")


class H4ck3rSCan
  def initialize
    if ARGV[0].nil?
      puts <<no_args
Wrong Syntax, you missed providing required CSV file
Syntax:
        $ ruby h4cker_s_can.rb sample_input/args.csv
no_args
      exit 1
    end
    @in_file_path = File.expand_path ARGV[0]
  end

  def h4ck3rscan
    InPut.new(@in_file_path).scan_csv
  end
end

H4ck3rSCan.new.h4ck3rscan
