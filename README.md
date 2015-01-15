# cmud-wot-world
Lua-based application core for use with cmud on wotmud.

## Installation
<Something about copy-pasting the contents of src/world.lua to an initializeWorld cmud alias>
<Likely need to insert the code of src/world.lua into an xml file in the format needed by cmud>

## Development
All development is done outside of cmud to enable unit testing. To perform development you must:
- Install lua 5.1: http://www.lua.org/download.html
- Install busted: http://olivinelabs.com/busted/
- Checkout code from GitHub!

Now open a terminal window and change to the local directory the code is checked out into. To run the test you:
> busted test/worldTest.lua

## Design
The general idea behind this application is to provide common handling of wotmud state. Using this state you can perform complex logic to ease mundain tasks and speed up the action. Generally interactions with the mud will not attempt to block-or-delay other commands from being send, except in very special cases.

### Random Thoughts
- Need to establish a deployment mechanism for the cmud scripts that includes the lua code. Perhaps a simple xml template and a map on how to assemble.
- Need to decide on a communication style. Promises, events, or passing anon functions...   ...perhaps events on object changes along with anon functions...
