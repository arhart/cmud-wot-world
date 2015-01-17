package.path = 'src/?.lua;lib/?.lua;lib/lustache/?.lua;' .. package.path;

local lustache = require('lustache');

local _worldFile = 'src/world.lua';


io.input(_worldFile);
local worldCode = io.read('*all');

--print(lustache:render('T{{value}}T', {value='oo'}));
--print(lustache:render('#############\n{{.}}\n###############', worldCode));
