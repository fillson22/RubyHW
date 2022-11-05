p 'Дано натуральное число N. 
   Если N-нечетное,то найти произведение 1*3*…*N;если N-четное,то найти произведение 2*4*…*N.'
p x=6
if x.even?
    p (1..x).to_a.select{|i| i.even?}.inject(){|i,j| i=i*j}
else
    p (1..x).to_a.select{|i| i.odd?}.inject(){|i,j| i=i*j}
end
