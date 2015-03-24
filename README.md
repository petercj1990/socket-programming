#socket-programming

This is for BYU's IT&nbsp;347 (computer networks) which I have TA'd for several semesters. A note to current students enrolled in this class: although the MIT license says you can copy and use this code (with attribution), it is plagiarism to use this for your projects (duh, but just putting it out there).

##Specifications
The specifications for the server are as follows (from [here](http://it347.groups.et.byu.net/Labs/IT%20347%20Project%201.html)):

Updated (on link) 2015-01-09

###Objective
- Gain experience with socket programming.
- Gain experience with client and server programs.
- Understand what goes into implementing protocols.
- Gain experience with HTTP and HTML client-server patterns.

###Instructions
You will create client and server applications to talk with each other as well as the clients and servers of other class members. Project 1 is a very simple command driven client and server. Project 2 gets a bit more exciting.

This can be written in any programming language. In fact, since every class member is working off the same protocol, you should be able to interface with a client or server written in a different language without a problem. Recommended languages include Python, C#, C/C++, Ruby, Java, Perl, etc.

There are many examples with similar code on the web. It is recommended to use these as examples, but none of them implement the entire project. Just like IT 210 or CS 142, you need to understand how all parts of your code work you may lose points if you cannot adequately explain how pieces of your code work.

###Specifications
####Server
- Open a listener on TCP port 9020.
- Implement the server such that (all client commands are case sensitive):
- Client open receives a response of "Welcome to <your name>'s chat room<cr><lf>"
- Client request "help<cr><lf>" receives a response of a list of the commands and their syntax.
- Client request "test: words<cr><lf>" receives a response of "words<cr><lf>"
- Client request "name: <chatname><cr><lf>" receives a response of "OK<cr><lf>"
- Client request "get<cr><lf>" receives a response of the entire contents of the chat buffer.
- Client request "push: <stuff><cr><lf>" receives a response of "OK<cr><lf>" The result is that "<chatname>: <stuff>" is added as a new line to the chat buffer.
- Client request "getrange <startline> <endline><cr><lf>" receives a response of lines <startline> through <endline> from the chat buffer. getrange assumes a 0-based buffer. Your client should return lines <startline> <endline>
- Client request "SOME UNRECOGNIZED COMMAND<cr><lf>" receives a response "Error: unrecognized command: SOME UNRECOGNIZED COMMAND<cr><lf>"
- Client request "adios<cr><lf>" will quit the current connection.
- Socket timeout can be avoided by using the following python code: s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

Similar functionality should be available from the operating system in other programming languages as well.

- All requests and responses must be terminated by a <cr><lf>
- The appearance of a <cr><lf> signifies the end of a request or a response.
- Client commands can be issued in any order.
- If a name hasn't been set use "unknown"
- If you extend the protocol as part of your extra features, you must support the original protocol in a backwards compatible manner.
- Don't insert extra tabbing/formatting unless it is enabled via a protocol extension.

####Client
- Run the client by typing: <yourclientprogram> <ipaddress> <port>
- Introduce yourself to the server (name: <name>)
- use help
- use test
- use name
- use get
- use getrange
- use adios
- All the commands and responses are written out to the screen for checking later.

###Grading
- (10) Demonstrate that your client works with your server.
- (15) Demonstrate that your client works with two other students' client/servers (both in a different language).
- (20) Pass the robust implementation test: [prj1_test.rb](http://it347.groups.et.byu.net/Labs/prj1_test.rb).
- (5) Add a command that upgrades your protocol to an enhanced protocol with a custom advanced command that interoperates with someone else in the class.
- (15) Fix your client broken by someone else's test case code (Dr. Tew's) and include in the write up what was broken, how you fixed it, and what you learned.
- (20) Project write-up and code package:
    - Project description and architecture. How are things structured and why?
    - Analysis of implementation issues. What were your bugs? How did you find them? How did you fix them?
    - Describe in your write-up your experiences interoperating with others' servers and clients. What problems did you have? What did you have to do to overcome incompatibilities between students' implementations?
    - (10) Appendix containing all code. You will be graded on code structure and readability. DO NO SUBMIT ZIP FILES.
    - Grammar and readability.
