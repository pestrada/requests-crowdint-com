Before('@observers') do
  ActiveRecord::Observer.enable_observers
end

After('@observers') do
  ActiveRecord::Observer.disable_observers
end

