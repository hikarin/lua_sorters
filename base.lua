Base = {}
function Base.new(vec)
   -- copy vectors
   local __vec = {}
   for i=0, #vec do
      __vec[i] = vec[i]
   end
   local obj = {vec=__vec}
   setmetatable(obj, {__index = Base})
   return obj
end

function Base:swap(i, j)
   self.vec[i], self.vec[j] = self.vec[j], self.vec[i]
end

function Base:show()
   for i=1, #self.vec do
      print(self.vec[i] .. ", ")
   end
end

function Base:check()
   for i=2, #self.vec do
      if(self.vec[i] < self.vec[i-1]) then
	 return false
      end
   end
   return true
end
