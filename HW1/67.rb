p 'Дан целочисленный массив. Проверить, чередуются ли в нем четные и нечетные числа.'
p  array=[8,13,18,-13,10,13,-6,3,16,3,-14,17,-14,9,6,3,4,13,16,1]
first_array,second_array = array.partition.with_index{ |i, j| j.even? }
p first_array.inject(true){ |i, j| i && j.even?}&second_array.inject(true){ |i, j| i && j.odd?} 