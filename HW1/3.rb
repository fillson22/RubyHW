p 'Дан целочисленный массив. 
Вывести номер первого из тех его элементов, которые удовлетворяют двойному неравенству: 
A[0] < A[i] < A[-1]. Если таких элементов нет, то вывести [ ].'
array=[8,14,18,12,10,18,5,2,13,0,14,17,14,9,7,3,0,18,15,0]
p array.index{|i| array[0]<i&&i<array[-1]} || []