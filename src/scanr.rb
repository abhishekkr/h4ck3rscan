#!/usr/bin/env ruby

require 'socket'  

class Scanr
  def initialize(host_port_msg)
    @csvdata=host_port_msg
  end

  def scan_host_port(machine, port)
    begin 
      sok = TCPSocket.new(machine, port)
      sok.close
      true
    rescue
      false
    end
  end

  def scanner
    @csvdata.each_key do |host|
      @csvdata[host].each_key do |port|
        if scan_host_port host.to_s, port.to_i
          puts port + " is OPEN at " + host + " <<< " + @csvdata[host][port]
        else
          puts port + " was Closed at " + host
        end
      end
    end
  end
end
