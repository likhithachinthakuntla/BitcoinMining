Database Operating System Principles
(COP 5615) - Fall 2022
Project 1
Anil Kumar Kondapalli
4511-2505
Likhitha Chinthakuntla
1172-3267



DESCRIPTION:

The goal of this first project is to use Erlang and the Actor Model to build a good solution to this problem that runs well on multi-core machines. We may divide the burden and employ several cores for speedier processing by building an actor-model framework since Bitcoin mining using SHA256 hashing is a time-consuming and intensive computational operation.

INSTRUCTIONS TO RUN CODE:

There are 6 files in this project. Of these files, 2 files will have to be compiled as follows:

c(main).
c(test).

Open 2 terminals, and after navigating to the source folder execute the following commands:

Terminal 1:
erl -sname anil(ip address of system 1)

Terminal 2:
erl -sname likhitha(ip address of system 2)

After initializing the boss, server with above commands, run the following commands:

Terminal 1:
main.start(4). [4 corresponds to the number of leading 0’s. Can be changed accordingly.]

Terminal 2:
test.start(‘anil@ipaddress’). [Worker nodes are initialized on a remote server.]

SYSTEM SPECIFICATION :

1. 	Apple intel i5 – 8 core machines
2. 	Apple M1 – 8 core machines