#!/usr/bin/env ruby

require File.expand_path(File.join File.dirname(__FILE__), "scanr.rb")

class InPut
  def initialize(in_file_path)
    @in_file_path=in_file_path
  end

  def scan_csv
    File.open(@in_file_path,"r"){ |fyl|
      fyl.each_line do |lyn|
        lyn_split = lyn.split(",")
        host=lyn_split[0].to_s.strip
        port=lyn_split[1].to_s.strip
        mesg=lyn_split[2].to_s.strip unless lyn_split[2].nil?
        if mesg.nil?
          Scanr.new(host, port).scanner 
        else
          param=lyn_split[3].to_s.strip unless lyn_split[3].nil?
          if param.nil?
            Scanr.new(host, port, mesg).scanner 
          else
            Scanr.new(host, port, mesg, param).scanner 
          end
        end
      end
    }
  end
end
