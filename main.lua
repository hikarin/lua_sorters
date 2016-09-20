require "bitonic"
require "bubble"
require "comb"
require "insertion"
require "quick"

local num = 1048576
math.randomseed(os.time())
elements = {}
for i=1, num do
  elements[i] = math.random(num)
end

function sort_test(algorithm)
   instance = algorithm.new(elements)
   local t1 = os.clock()
   instance:sort()
   local t2 = os.clock()
   if instance:check() then
      str_name = string.format("%-10s", algorithm:name())
      str_time = string.format("%10.2f[ms]", (t2-t1)*1000)
      print(str_name .. ": " .. str_time)
   else
      print(algorithm:name() .. ": failure")
   end
end

sort_test(Bitonic)
sort_test(Quick)
sort_test(Comb)
sort_test(Insertion)
sort_test(Bubble)
