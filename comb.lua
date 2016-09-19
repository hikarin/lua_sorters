require "base"

Comb = {}
setmetatable(Comb, {__index = Base})

function Comb.new(vec)
   local obj = Base.new(vec)
   setmetatable(obj, {__index = Comb})
   return obj
end

function Comb:sort()
   local sz = #self.vec
   local h = math.floor(sz/2)
   while(h>=1) do
      changed = false
      for i=1, sz do
	 if i+h<=sz then
	    if(self.vec[i] > self.vec[i+h]) then
	       self:swap(i, i+h)
	       changed = true
	    end
	 end
      end
      if h==1 then
	 if (not changed) then
	    break
	 end
      else
	 h = math.floor(h/1.3)
      end
   end
end

function Comb:name()
   return "Comb"
end
