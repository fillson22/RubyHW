array=[621, 445, 147, 159, 430, 222, 482, 44, 194, 522, 652, 494, 
    14, 126, 532, 387, 441, 471, 337, 446, 18, 36, 202, 574, 556, 458, 16, 139, 
    222, 220, 107, 82, 264, 366, 501, 319, 314, 430, 55, 336]
#p array.size

#p array.reverse

#p array.max

#p array.min

#p array.sort{|i,j| i<=>j}

#p array.sort{|i,j| j<=>i}

#p array.delete_if{|i| i.odd?}

#p array.select{|i| (i%3).zero?}

#p array.uniq

#p array.map{|i| i.to_f/10}

#p array.select { |i| i >= 65 && i<=122 }.map{|i| i.chr}

#array[array.index(array.min)], array[array.index(array.max)] = array[array.index(array.max)], array[array.index(array.min)] 
#p array

#p array[0..(array.index(array.min)-1)]

#p array.min(3)