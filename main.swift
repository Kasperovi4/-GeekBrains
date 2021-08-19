//
//  main.swift
//  5Kasperovich
//
//  Created by Дмитрий Касперович on 19.08.2021.
//

import Foundation



protocol Car {

    var statWindow: StatWindow {get set}
    var marka: String {get}
    var statEngine: StatEngine {get set}
    
    func  statwindow()
    func  statengine()
}

enum Privod: String {
    case full = "Полный привод"
    case notFull = "Не полный привод"
}

enum StatWindow: String {
    case Open = "Открыты"
    case Close = "Закрыты"}

enum StatEngine: String {
    case On = "Включен"
    case Off =  "Выключен"}

extension Car {
   
    
    
    func statwindow() {
      if statWindow == .Open{
           print ("\(marka) Окна открыты")
    }
        else if statWindow == .Close {
           print("\(marka) Окна закрыты")
        }
    }
    func statengine() {
        if statEngine == .On{
            print ("\(marka) Двигатель запущен")
        }
        else if statEngine == .Off {
            print("\(marka) Двигатель заглушен")
        }
    }
}

class SportCar: Car, CustomStringConvertible {
    
    var description: String {
        return """
             Марка: \(marka)
             Статус Окна: \(statWindow.rawValue)
             Статус Двигателя: \(statEngine.rawValue)
             Какой привод: \(privod.rawValue)
             """
    }
    
    var statWindow: StatWindow
    var marka: String
    var statEngine: StatEngine
    var privod : Privod
    
    init(statWindow: StatWindow, marka: String, statEngine: StatEngine, privod : Privod){
        self.privod = privod
        self.marka = marka
        self.statEngine = statEngine
        self.statWindow = statWindow
    }
    func privodCar(privod: Privod) {
        
        self.privod = privod
        print("У \(marka) теперь \(privod.rawValue)")
        

    }
}

class trackCar: Car, CustomStringConvertible {
    var description: String {
        return """
                 Марка: \(marka)
                 Статус Окна: \(statWindow.rawValue)
                 Статус Двигателя: \(statEngine.rawValue)
                 Наличие Цистерны: \(statusCicterna.rawValue)
                 """
    }
    
    var statWindow: StatWindow
    var marka: String
    var statEngine: StatEngine
    var statusCicterna : StatusCicterna
    
    init(statWindow: StatWindow, marka: String, statEngine: StatEngine, statusCicterna : StatusCicterna){
        self.statusCicterna = statusCicterna
        self.marka = marka
        self.statEngine = statEngine
        self.statWindow = statWindow
    }
    enum StatusCicterna: String {
        case Yes = "Цистерна прицеплена"
        case Not = "Цистерна отцеплена"}
    
    func trackCar(statusCicterna: StatusCicterna) {
        
        self.statusCicterna = statusCicterna
        print("\(statusCicterna.rawValue) у машины \(marka)" )
        
    }
}

var sportCar1 = SportCar(statWindow: .Open, marka: "BMW", statEngine: .On, privod: .full)
var sportCar2 = SportCar(statWindow: .Close, marka: "HONDA", statEngine: .Off, privod: .notFull)



var trackCar1 = trackCar(statWindow: .Open, marka: "VOLVO", statEngine: .On, statusCicterna: .Yes)
var trackCar2 = trackCar(statWindow: .Close, marka: "IVEKO", statEngine: .Off, statusCicterna: .Not)

//print(sportCar1)
//print(sportCar2)
//print(trackCar1)
//print(trackCar2)


sportCar1.privodCar(privod: .notFull)
sportCar2.statEngine = .On
trackCar1.trackCar(statusCicterna: .Not)
trackCar2.statWindow = .Open
print(sportCar1)
print(sportCar2)
print(trackCar1)
print(trackCar2)
