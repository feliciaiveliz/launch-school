The Internet:
- Have a broad understanding of what the internet is and how it works
- How do the first 3 layers enable 
- Understand the characteristics of the physical network, such as latency and bandwidth
- Have a basic understanding of how lower-level protocols operate
- Know what an IP address is and what a port number is
- Have an understanding of how DNS works
- Understand the client-server model of web interactions, and the role of HTTP as a protocol within that model

TCP & UDP
- Have a clear understanding of the TCP and UDP protocols, their similarities and differences
- Have a broad understanding of the three-way handshake and its purpose
- Have a broad understanding of flow control and congestion avoidance

URLs
- Be able to identify the components of a URL, including query strings
- Be able to construct a valid URL
- Have an understanding of what URL encoding is and when it might be used

HTTP and the Request/Response Cycle
- Be able to explain what HTTP requests and responses are, and identify the components of each
- Be able to describe the HTTP request/response cycle
- Be able to explain what status codes are, and provide examples of different status code types
- Understand what is meant by 'state' in the context of the web, and be able to explain some techniques that are used to simulate state
- Explain the difference between GET and POST, and know when to choose each

Security
- Have an understanding of various security risks that can affect HTTP, and be able to outline measures that can be used to mitigate against these risks
- Be aware of the different services that TLS can provide, and have a broad understanding of each of those services



=begin

OSI - 7 layers - Focused on function
Application
 - layer closest to user and deals with the actual applications you're using
Presentation
 - how to present the content
Session
 - how to establish a secure connection
Transport
 - how to get messages to a location
 - segment
Network
 - ip packets
 - ability to have logical addresses
Data link
 - bits
Physical

TCP/IP - 4 layers - Focused on boundaries
Application
 - browser
 - anything beyond transfer of information
Transport
 - moving between networks
Internet
 - logical addressing
Link
 - devices
 
LS Model

Application
Transport
--- Lower - Reliability ----------- 
Network
Data Link
Physical


The Internet

  Have a broad understanding of what the internet is and how it works
    - Felicia - internet is a network of networks
  Understand the characteristics of the physical network, such as latency and bandwidth 
    - latency - measure of delay ( how long does the information take to get from point A to point B) 
      - PTPQ
      - processing - router to router
      - transmission - PROTOCOLS or transport problems
      - propagation ( a - to - b) - time for movement
      - queueing delay - standing in line
    - bandwidth
      - max amount of data that can be transfered at a specific time
      - max amount of flights at a time
  Have a basic understanding of how lower level protocols operate
    - reliability
  Know what an IP address is and what a port number is
    - socket - ip address + port
    - IP address - internet protocol - similar to a physical address - how other networks know how to communicate ( IPv4 - public facing address, private address - 192.168.0.1-255)
    - port number - dedicated channel for certain types of information ( HTTP 80, HTTPS 443) - you can set up your own ports.
  Have an understanding of how DNS works
    - DNS stands for Domain Name System - type in a domain name (or full url) google.com and it connects you to another address. 
  Understand the client-server model of web interactions, and the role of HTTP as a protocol within that model
    - client-server model - basically you have a system that needs info, sends a request to a server and the server will listen for a request - do what it needs to and send a response back to client.
    - HTTP is a default protocol that your requests go through - HTML is paired with HTTP - typically 

TCP & UDP
Have a clear understanding of the TCP and UDP protocols, their similarities and differences
Have a broad understanding of the three-way handshake and its purpose
Have a broad understanding of flow control and congestion avoidance

=end