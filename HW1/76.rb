p 'Дан целочисленный массив. Найти среднее арифметическое квадратов его элементов.'
p  array=[3,2,3,2]
p (array.map{|i| i**2}.inject(){|i,j| i=i+j}).to_f/(array.size).to_f