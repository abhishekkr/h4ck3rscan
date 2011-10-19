#!/usr/bin/env ruby

require 'socket'  

class SocketHandler
  def scan_tcp_port(host, port)
    begin 
      sok = TCPSocket.new(host, port.to_i)
      sok.close
      true
    rescue
      false
    end
  end

  def scan_by_mesg(host, port, mesg, mesg_data)
  end
end
