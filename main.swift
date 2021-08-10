//
//  main.swift
//  3Kasperovich_D
//
//  Created by Дмитрий Касперович on 09.08.2021.
//

import Foundation


enum Engine: String {
    case On = "Включен"
    case Off = "Выключен"
}
enum Window: String {
    case Open = "Отрыты"
    case Close = "Закрыты"
}
enum Trunk: String {
    case Yes = "Да"
    case Not = "Нет"
}
 
struct Car: CustomStringConvertible {
    
    var description: String {
        return """
           Марка: \(marka)
           Год выпуска: \(yearOfRelease)
           Окна: \(window.rawValue)
           Объем Багажника: \(capacity)
           Двигатель: \(engine.rawValue)
           Гружоный: \(trunk.rawValue)
           
           """
    }

    var marka: String
    var yearOfRelease: Int
    var capacity: Int
    var engine: Engine
    var window: Window
    var trunk: Trunk

    mutating func setWindow(window: Window) {
        self.window = window
    
    }
    func printYear() {
        print("Автомобиль \(yearOfRelease) года выпуска")
    }
    
}

var car1 = Car(marka: "Rover", yearOfRelease: 2020, capacity: 400, engine: .On, window: .Open, trunk: .Not)
var car2 = Car(marka: "Volvo", yearOfRelease: 2000, capacity: 1000, engine: .Off, window: .Close, trunk: .Yes)


car2.yearOfRelease = 2005
car2.printYear()
car1.setWindow(window: .Close)


print(car1)
print(car2)


let Possibility = [
("Запус двигателя", "Открыть окно", "Погрузить",
    "Заглушить двигатель", "Закрыть окно", "Выгрузить")]

enum PrintPossibilityMode: String {
    case Variant1
    case Variant2
    
}
func PrintPossibility ( Possibility: [(String, String, String, String, String, String)], mode:PrintPossibilityMode){
print (mode.rawValue, ":\n")
    for i in Possibility{
        switch mode {
        case .Variant1:
            print(i.0,",", i.1,"," ,i.2)
        case .Variant2:
            print(i.3,",", i.4,",", i.5)
        }
    }
}
PrintPossibility( Possibility: Possibility, mode: .Variant2)


