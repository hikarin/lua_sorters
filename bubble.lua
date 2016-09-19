require "base"

Bubble = {}
setmetatable(Bubble, {__index = Base})

function Bubble.new(vec)
   local obj = Base.new(vec)
   setmetatable(obj, {__index = Bubble})
   return obj
end

function Bubble:sort()
   for i=1, #self.vec do
      local changed = false
      for j=1, #self.vec-i do
	 if self.vec[j+1] < self.vec[j] then
	    self:swap(j+1, j)
	    changed = true
	 end
      end
      if not changed then
	 break
      end
   end
end

function Bubble:name()
   return "Bubble"
end
