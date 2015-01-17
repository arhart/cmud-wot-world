local world = world;
if (world == nil)
  world = {};
end

world.vars = {
  thirst = false,
  hunger = false,
  position = 'stand',
  container = 'sack'
};


return world;
