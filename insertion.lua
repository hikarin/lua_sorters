require "base"

Insertion = {}
setmetatable(Insertion, {__index = Base})

function Insertion.new(vec)
   local obj = Base.new(vec)
   setmetatable(obj, {__index=Insertion})
   return obj
end

function Insertion:sort()
   for i=1, #self.vec do
      for j=i, #self.vec do
	 if(self.vec[i] >= self.vec[j]) then
	    self:swap(i, j)
	 end
      end
   end
end

function Insertion:name()
   return "Insertion"
end
