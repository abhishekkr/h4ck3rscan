#!/usr/bin/env ruby

class MesgHandler
  def initialize(mesg, mesg_data, sockethandler)
    begin
      self.__send__ mesg, mesg_data, sockethandler
    rescue
      no_handler_for_me mesg, sockethandler if @status.nil?
    end
  end

  def get_status
    @status
  end
  
  def no_handler_for_me(mesg, sockethandler)
    @status = sockethandler.no_mesg_handler mesg
  end
  
  def dump_exec_output(cmd_path, sockethandler)
    @status = "Error: #{cmd_path} is not executable."
    return unless File.executable? cmd_path
    exit_code=%x{#{cmd_path} #{sockethandler.get_host} #{sockethandler.get_port}; echo $?}.split[-1]
    if status==="0"
      @status = "#{@port} is OPEN at #{@host}"
      @status += " <<<<< #{mesg}"  unless mesg.nil?
    else
      @status = "#{@port} was Closed at #{@host}"
    end 
  end
  
  def dump_bin_file(fylname, sockethandler)
    @status = "Error: #{fylname} is not readable." 
    @status = sockethandler.scan_by_sending_message IO.read(fylname) if File.readable? fylname
  end
  
  def dump_txt_file(fylname, sockethandler)
    @status = "Error: #{fylname} is not readable."
    return unless File.readable? fylname
    File.open(fylname, "r"){ |fyl|
      @status = sockethandler.scan_by_sending_message fyl.read
    }
  end
  
  def dump_text(txt, sockethandler)
    txt_ = txt.split("\"")[1..-1].join.gsub("\\n","\n")
    @status = sockethandler.scan_by_sending_message txt_
  end
  
  def http_head(get_resource, sockethandler)
    #sockethandler.scan_by_sending_message result
  end
  
  def http_options(get_resource, sockethandler)
    #sockethandler.scan_by_sending_message result
  end
  
  def http_get(get_resource, sockethandler)
    #sockethandler.scan_by_sending_message result
  end
  
  def http_post(get_resource, sockethandler)
    #sockethandler.scan_by_sending_message result
  end
  
  def http_put(get_resource, sockethandler)
    #sockethandler.scan_by_sending_message result
  end
  
  def http_delete(get_resource, sockethandler)
    #sockethandler.scan_by_sending_message result
  end
  
  def ssh_login(get_resource, sockethandler)
    #sockethandler.scan_by_sending_message result
  end
  
  def ftp_login(get_resource, sockethandler)
    #sockethandler.scan_by_sending_message result
  end
end

