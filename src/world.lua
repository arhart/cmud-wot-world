function default(...)
  for i=1, select('#', ...) do
    local arg = select(i, ...);
    if (arg ~= nil) then
      return arg;
    end
  end
end

local utils = {
  __print = print,
  __send = default(send, print),
  default = default
};

function utils.join(separator, ...)
  local argNum = select('#', ...);
  local sep = utils.default(separator, ' ');
  local assembly = '';
  local isFirst = true;
  for i=1, select('#', ...) do
    local arg = select(i, ...);
    local argType = type(arg);
    if (argType == 'number' or argType == 'string') then
      if (isFirst) then
        assembly = arg;
        isFirst = false;
      else
        assembly = assembly .. sep .. arg;
      end
    end
  end
  return assembly;
end

function utils.echo(...)
  utils.__print(utils.join(' ', ...));
end

function utils.send(...)
  utils.__send(utils.join(' ', ...));
end

local world = {
  utils = utils
};

return world;
