import UIKit

// Задание 1

// Функция map - возвращает преобразованный массив

//func map<T>(_ transform: (Element) throws -> T) rethrows -> [T]
// transform принимает элемент этой последовательности в качестве своего параметра и возвращает преобразованное значение того же или другого типа.


var arrayInt = [1, 2, 3, 4, 5]
var arrayString = ["Ann", "Kate", "Olga"]

extension Collection {

func map<T>(_ transform: (Element) -> T) -> [T] {
    
    var result: [T] = []
    for i in self {
        result.append(transform(i))
    }
    
    return result
}
}

let newMap = arrayInt.map { (item) -> Int in
return item + 10
}
print(newMap)

let map = arrayInt.map({ $0 + 10 })
print(map)


let newMapString = arrayString.map({ $0.lowercased() })
print(newMapString)

let mapString = arrayString.map({ $0.lowercased() })
print(mapString)

// Функция reduce - Возвращает результат объединения элементов последовательности с использованием заданного замыкания.
// func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result

extension Array {

func reduceResult<Result>(parametr1: Result, parametr2: (Result, Element) -> Result) -> Result {
    
    var result = parametr1
    
    forEach {
        result = parametr2(result, $0)
    }
    
    return result
}
}

let reduceNumber = [1, 2, 3, 4]
let resultReduce = reduceNumber.reduceResult(parametr1: 0, parametr2: { sum, element in
sum + element
})
print(resultReduce)

// Функция filter - возвращает массив согласно условию
// func filter(_ isIncluded: (Self.Element) throws -> Bool) rethrows -> [Self.Element]

func myFilter(param1: [Int]) -> [Int] {

var result = [Int]()
for i in param1 {
    if i % 2 == 0 {
        result.append(i)
    }
}

return result
}

print(myFilter(param1: [1, 2, 3, 4]))

extension Collection {

func myFilter2(param1: (Element) -> Bool) -> [Element] {
    
    var filterResult = [Element]()
    
    forEach { element in
        if param1(element) {
            filterResult.append(element)
        }
    }
    
    return filterResult
}
}

let arrayFilter = [1, 2, 3, 4, 6]
print(arrayFilter.myFilter2 { element in
element % 2 == 0
})

// Задание 2
// Сортировка пузырьком - пробежаться по массиву и сравнить каждые 2 соседних элемента

var list = [1, 3, 5, 6, 2, 99, 86, 77]

for i in 0..<list.count {

let index = (list.count - 1) - i   // последний элемент

for j in 0..<index {
    
    let number = list[j]
    let numberNext = list[j + 1]
    if number > numberNext {

        list[j + 1] = number
        list[j] = numberNext
        print(list)
    }
}
}

list.sort()  // как легко просто sort сделать))))

// cортировка слиянием

let numberMergeSort = [1, 3, 5, 6, 78, 90, 45, 33, 23, 44, 67]

// сравнивает первые элементы в массивых и после сравнения удаляет и добавляет в определенный нами массив. Как только в одном массиве элементов становится равное нулю- то элементы из другого массива добавляются неотсортированными в конец


func merge(leftArray: [Int], rightArray: [Int]) -> [Int] {

var sortArray: [Int] = []
var left = leftArray
var right = rightArray

while left.count > 0 && right.count > 0 {
    if left.first! < right.first! {
        sortArray.append(left.removeFirst())
    } else {
        sortArray.append(right.removeFirst())
    }
}

return sortArray + left + right
}


merge(leftArray: [1, 3, 6], rightArray: [2, 4, 5, 9, 7])

func mergeSort(array: [Int]) -> [Int] {

guard array.count > 1 else { return array }

let leftArray = Array(array[0..<array.count / 2])
let rightArray = Array(array[array.count / 2..<array.count])

return merge(leftArray: mergeSort(array: leftArray), rightArray: mergeSort(array: rightArray))
}

print(mergeSort(array: numberMergeSort))

