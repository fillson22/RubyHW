p 'Дан целочисленный массив. Проверить, чередуются ли в нем положительные и отрицательные числа.'
p  array=[8,14,18,-12,10,18,-6,2,16,1,-14,17,-14,9,6,3,4,18,16,1]
first_array,second_array = array.partition.with_index{ |i, j| j.positive? }
p first_array.inject(true){ |i, j| i && j.positive?}&second_array.inject(true){ |i, j| i && j.negative?}