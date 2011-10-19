#!/usr/bin/env ruby

class InPut
  def initialize(csv_file_path)
    @host_port_msg={}
    File.open(csv_file_path,"r"){ |fyl|
      fyl.each_line do |lyn|
        lyn_split = lyn.split(",")
        host=lyn_split[0].to_s.strip
        port=lyn_split[1].to_s.strip
        mesg=lyn_split[2].to_s.strip unless lyn_split[2].nil?
        @host_port_msg[host] ||= {}
        @host_port_msg[host][port] ||= ""
        unless mesg.nil?
          param=lyn_split[2].to_s.strip unless lyn_split[3].nil?
          @host_port_msg[host][port]={}
          @host_port_msg[host][port][mesg]=param
        end
      end
    }
  end

  def get_host_port_msg
    @host_port_msg
  end
end
