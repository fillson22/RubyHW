p 'Дан целочисленный массив. Найти количество его локальных максимумов.'
p array=[8,14,18,12,10,18,5,2,13,0,14,17,14,9,7,3,0,18,15,0]
p (1..array.size-2).to_a.select{|i| array[i-1]<array[i] && array[i]>array[i+1]}.size