package.path = '../src/?.lua;src/?.lua;' .. package.path;
local world = require('utils');

local lastSend;
local lastEcho;
world.utils.__send = function(...)
  lastSend = world.utils.join(' ', ...);
end
world.utils.__print = function(...)
  lastEcho = world.utils.join(' ', ...);
end

describe('the core utilities', function()
  local utils = world.utils;

  after_each(function() 
    lastSend = nil;
    lastPrint = nil;
  end);

  it('provides utils.default', function()
    assert.are_equal('value1', utils.default(nil, 'value1'));
    assert.are_equal('value2', utils.default(nil, nil, 'value2', 'value3'));
    assert.are_equal('value4', utils.default('value4', nil));
    assert.is_nil(utils.default(nil, nil));
    assert.are_equal(0, utils.default(0, 'value5'));
    assert.are_equal(false, utils.default(false, 'value6'));
    local func = function()end;
    assert.are_equal(func, utils.default(func, 'value7'));
  end);
  it('provides utils.join', function()
    assert.are_equal('2,three', utils.join(',', true, 2, 'three'));
    assert.are_equal('2, three', utils.join(', ', true, 2, 'three'));
    assert.are_equal('three', utils.join(',', true, nil, 'three'));
    assert.are_equal('four', utils.join(',', 'four', function()end));
    assert.are_equal('', utils.join(','));
    assert.are_equal('', utils.join());
    assert.are_equal('', utils.join(nil));
  end);
  it('provides utils.echo for commands to be delivered to the mud', function()
    utils.echo('bs', 'beasty');
    assert.are_equal('bs beasty', lastEcho);
    utils.echo();
    assert.are_equal('', lastEcho);
    utils.echo(nil);
    assert.are_equal('', lastEcho);
  end);
  it('provides utils.send for commands to be delivered to the mud', function()
    utils.send('bs', 'beast');
    assert.are_equal('bs beast', lastSend);
    utils.send();
    assert.are_equal('', lastSend);
    utils.send(nil);
    assert.are_equal('', lastSend);
  end);
end);

