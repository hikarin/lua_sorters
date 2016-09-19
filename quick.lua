require "base"

Quick = {}
setmetatable(Quick, {__index = Base})

function Quick.new(vec)
   local obj = Base.new(vec)
   setmetatable(obj, {__index = Quick})
   return obj
end

function Quick:partition(array, left, right, pivotIndex)
   local pivotValue = array[pivotIndex]
   self:swap(pivotIndex, right)   
   local storeIndex = left
   for i = left, right-1 do
      if array[i] <= pivotValue then
	 self:swap(i, storeIndex)
	 storeIndex = storeIndex + 1
      end
   end
   self:swap(storeIndex, right)
   return storeIndex
end

function Quick:quicksort(array, left, right)
   if right > left then
      local pivotNewIndex = self:partition(array, left, right, left)
      self:quicksort(array, left, pivotNewIndex-1)
      self:quicksort(array, pivotNewIndex+1, right)
   end
end

function Quick:sort()
   self:quicksort(self.vec, 1, #self.vec)
end

function Quick:name()
   return "Quick"
end
