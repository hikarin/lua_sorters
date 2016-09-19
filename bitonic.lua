require "base"

int_max = 9223372036854775807
Bitonic = {}
setmetatable(Bitonic, {__index = Base})

function Bitonic.new(vec)
   local obj = Base.new(vec)
   setmetatable(obj, {__index = Bitonic})
   return obj
end

function Bitonic:sort()
   prev_size = #self.vec
   new_size = prev_size
   while( not ( bit.band(new_size, new_size-1) == 0 ) ) do
      self.vec[new_size+1] = int_max
      new_size = new_size+1
   end
   self:sort_sub(true, 1, new_size)
end

function Bitonic:sort_sub(up, start, width)
   if width <= 1 then
      return
   end
   local d = math.floor(width/2)
   self:sort_sub(true, start, d)
   self:sort_sub(false, start+d, d)
   self:merge(up, start, width)
end

function Bitonic:merge(up, start, width)
   if width <= 1 then
      return
   end
   local d = math.floor(width/2)
   local middle = start+d
   for i=start, middle-1 do
      self:compare(up, i, i+d)
   end
   self:merge(up, start, d)
   self:merge(up, middle, d)
end

function Bitonic:compare(up, i, j)
   if ( up == (self.vec[i] > self.vec[j]) ) then
      self:swap(i, j)
   end
end

function Bitonic:name()
   return "Bitonic"
end
