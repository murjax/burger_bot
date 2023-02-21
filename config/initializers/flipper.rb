Flipper.register(:test_group) do |actor, _context|
  actor.respond_to?(:test_group?) && actor.test_group?
end
