p 'Дан целочисленный массив. Найти среднее арифметическое модулей его элементов.'
p  array=[3,2,-3,2]
p (array.map{|i| i.abs}.inject(){|i,j| i=i+j}).to_f/(array.size).to_f