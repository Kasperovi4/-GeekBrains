//
//  main.swift
//  6Kasperovich
//
//  Created by Дмитрий Касперович on 22.08.2021.
//

import Foundation

struct Repka {
    var name: String
    var place: Int
}

extension Repka: CustomStringConvertible {
    var description : String {
        return "Name: \(name), Place: \(place)"
    }
}


struct Queue <T> {
    var elements: [T] = []
    
    var isEmpty: Bool {
        return elements.count == 0
    }
    
    mutating func push(element: T) {
        elements.append(element)
    }
    mutating func pop()->T {
        return elements.removeLast()
    }
    
     var head: T? {
        if isEmpty {
            print("Элементы не найдены. Массив пуст")
            return nil
        } else {
            print("Последний Элемент \(elements.last!)")
            return elements.last
        }
    }
    
     var front: T? {
        if isEmpty {
            print("Элементы не найдены. Массив пуст")
            return nil
        } else {
            print("Первый элемент  \(elements.first!)")
            return elements.first
        }
    }
    
    func printMyRepka() {
        print(elements)
    }
    
    subscript(index: Int) -> T? {
            guard index < elements.count, index >= 0 else { return nil }
            return elements[index]
        }
}

extension Queue {
    func myFilter(predicate:(T) -> Bool) -> [T] {
        var result = [T]()
        for i in elements {
            if predicate(i) {
                result.append(i)
            }
        }
        return result
    }
}

var pupil = Queue<Repka>()
pupil.push(element: .init(name: "Дед", place: 1))
pupil.push(element: .init(name: "Бабка", place: 2))
pupil.push(element: .init(name: "Вунчка", place: 3))
pupil.push(element: .init(name: "Жучка", place: 4))
pupil.push(element: .init(name: "Кошка", place: 5))
pupil.push(element: .init(name: "Мышка", place: 6))
print(pupil[2]!)

pupil.printMyRepka()

let honoursPupil = pupil.myFilter(predicate: {$0.place == 3})
print(honoursPupil)

