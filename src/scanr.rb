#!/usr/bin/env ruby

require File.expand_path(File.join File.dirname(__FILE__), "portscanner.rb") 

class Scanr
  def initialize(host_port_msg)
    @csvdata=host_port_msg
    @portscanner = PortScanner.new
  end

  def scan_result(status, host, port, mesg=nil)
    if status
      print mesg + " <<< " unless mesg.nil?
      puts port + " is OPEN at " + host
    else
      puts port + " was Closed at " + host
    end
  end

  def scanner
    @csvdata.each_key do |host|
      @csvdata[host].each_key do |port|
        host_port=@csvdata[host][port]
        if host_port.nil?
          scan_host_port host, port
        else
          host_port.each_key do |mesg|
            if host_port[mesg].nil?
              scan_result (@portscanner.scan_tcp_port host, port), host, port, mesg
            else
              scan_result (@portscanner.scan_by_mesg host, port, mesg, host_port[mesg]), host, port
            end
          end
        end
      end
    end
  end
end
