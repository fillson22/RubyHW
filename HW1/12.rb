p 'Дан целочисленный массив. Заменить все отрицательные элементы на значение максимального.'
p  array=[8,14,18,-12,10,18,-5,2,13,1,-14,17,-14,9,7,3,1,18,15,1]
p  array.map{|i| i<0? array.max : i}