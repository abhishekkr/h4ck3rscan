#!/usr/bin/env ruby

require 'socket'  

class SocketHandler
  def initialize(host, port)
    @host=host
    @port=port
  end

  def scan_tcp_port(mesg=nil)
    begin 
      sok = TCPSocket.new(@host, @port.to_i)
      sok.close
      status = "#{@port} is OPEN at #{@host}"
      status += " <<<<< #{mesg}"  unless mesg.nil?
      status
    rescue
      "#{@port} was Closed at #{@host}"
    end
  end
    
  def no_mesg_handler(handler)
    "#{@port} is NOT CHECKED at #{@host} as #{handler} is not available in Message Handler"
  end

  def scan_by_sending_message(mesg_data)
    begin
      sok = TCPSocket.new(@host, @port.to_i)
      sok.setsockopt(Socket::IPPROTO_TCP, Socket::TCP_NODELAY, 1)
      sok.write mesg_data
      @sok_recvd = sok.recv(1000)
      sok.close
      status = "#{@port} is OPEN at #{@host}"
      status += " <<<<< #{@sok_recvd.to_s.lines.first.strip}"  unless @sok_recvd.nil?
      status
    rescue
      "#{@port} was Closed at #{@host}"
    end
  end
end
