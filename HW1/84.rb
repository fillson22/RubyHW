p 'Дано натуральное число N. Найти результат следующего произведения 1*2*…*N.'
p x=6
p (1..x).to_a.inject(){|i,j| i=i*j}