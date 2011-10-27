#!/usr/bin/env ruby

class MesgHandler
  def initialize(mesg, mesg_data, sockethandler)
    self.__send__ mesg, mesg_data, sockethandler
  end
  
  def get_status
    @status
  end
  
  def exec_cmd(cmd_path, sockethandler)
    exit_code=%x{#{cmd_path} #{sockethandler.get_host} #{sockethandler.get_port}; echo $?}.split[-1]
    if status==="0"
      status = "#{@port} is OPEN at #{@host}"
      status += " <<<<< #{mesg}"  unless mesg.nil?
      status
    else
      "#{@port} was Closed at #{@host}"
    end 
  end
  
  def dump_exec_output(cmd_path, sockethandler)
    sockethandler.scan_by_sending_message %x{#{cmd_path} #{sockethandler.get_host} #{sockethandler.get_port}}
  end
  
  def dump_bin_file(fylname, sockethandler)
    sockethandler.scan_by_sending_message IO.read(fylname)
  end
  
  def dump_txt_file(fylname, sockethandler)
    File.open(fylname, "r"){ |fyl|
      @status = sockethandler.scan_by_sending_message fyl.read
    }
  end
  
  def dump_text(txt, sockethandler)
    sockethandler.scan_by_sending_message txt
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

