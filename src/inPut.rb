#!/usr/bin/env ruby

class InPut
  def initialize(csv_file_path)
    @host_port_msg={}
    File.open(csv_file_path,"r"){ |fyl|
      fyl.each_line do |lyn|
        lyn_split = lyn.split(",")
        host=lyn_split[0].to_s.strip
        port=lyn_split[1].to_s.strip
        mesg=lyn_split[2].to_s.strip
        @host_port_msg[host] ||= {}
        @host_port_msg[host][port] = mesg
      end
    }
  end

  def get_host_port_msg
    @host_port_msg
  end
end
