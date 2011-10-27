#!/usr/bin/env ruby

require File.expand_path(File.join File.dirname(__FILE__), "sockethandler.rb") 
require File.expand_path(File.join File.dirname(__FILE__), "mesghandler.rb") 

class Scanr
  def initialize(host, port, mesg=nil, param=nil)
    @host=host
    @port=port
    @mesg=mesg
    @param=param
    @sockethandler = SocketHandler.new(host, port)
  end

  def show_scan_result(status)
    puts status
  end

  def scanner
    if @mesg.nil?
      show_scan_result @sockethandler.scan_tcp_port
    else
      if @param.nil?
        show_scan_result @sockethandler.scan_tcp_port + " [" + @mesg + "]"
      else
        show_scan_result MesgHandler.new(@mesg, @param, @sockethandler).get_status
      end
    end
  end

end
