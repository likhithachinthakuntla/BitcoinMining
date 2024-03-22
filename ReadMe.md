Problem Definition
Bitcoins (seehttp://en.wikipedia.org/wiki/Bitcoin) are the most popular crypto-currency in common use. At their heart, bitcoins use the hardness of cryptographic hashing (for a reference seehttp://en.wikipedia.org/wiki/Cryptographichashfunction)to ensure a limited “supply” of coins.  In particular, the key component in a bit-coin is an input that, when “hashed” produces an output smaller than a target value.  In practice, the comparison values have leading  0’s, thus the bitcoin is required to have a given number of leading 0’s (to ensure 3 leading 0’s, you look for hashes smaller than0x001000... or smaller or equal to 0x000ff....The hash you are required to use is SHA-256.  You can check your version against this online hasher:http://www.xorbin.com/tools/sha256-hash-calculator. For example, when the text “COP5615 is a boring class” is hashed, the value fb4431b6a2df71b6cbad961e08fa06ee6fff47e3bc14e977f4b2ea57caee48a4 is obtained.  For the coins, you find, check your answer with this calculator to ensure correctness. The goal of this first project is to use Erlang and the Actor Model to build a good solution to this problem that runs well on multi-core machines.

Requirements
Input: The input provided (as command line to yourproject1.fsx) will be, the required number of 0’s of the bitcoin.1


Output: Print, on independent

entry lines, the input string, and the correspondingSHA256 hash separated by a TAB, for each of the bitcoins you find. Obviously, your SHA256 hash must have the required number of leading 0s (k= 3 means3 0’s in the hash notation).  An extra requirement, to ensure every group finds different coins, is to have the input string prefixed by the gator link ID of one of the team members.


DESCRIPTION:

The goal of this project is to use Erlang and the Actor Model to build a good solution to this problem that runs well on multi-core machines. We may divide the burden and employ several cores for speedier processing by building an actor-model framework since Bitcoin mining using SHA256 hashing is a time-consuming and intensive computational operation.

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

