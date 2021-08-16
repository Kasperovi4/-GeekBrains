//
//  main.swift
//  4Kasperovich
//
//  Created by Дмитрий Касперович on 15.08.2021.
//

import Foundation


enum Engine: String {
 case On = "Включен"
 case Off = "Выключен"
}
enum Window: String {
 case Open = "Открыты окна"
 case Close = "Закрыты окна "
}
enum Trunk: String {
     case Yes = "Гружоный"
     case Not = "Пустой"
}


 class Car {
    
     var description: String {
         return """
            Марка: \(marka)
            Год выпуска: \(yearOfRelease)
            Окна: \(window.rawValue)
            Двигатель: \(engine.rawValue)
            Гружоный: \(trunk.rawValue)
            Привод: \(privod)
            """
     }
     var marka: String
     var yearOfRelease: Int
     var engine: Engine
     var window: Window
     var trunk: Trunk
     var privod: Int
    
    init (marka: String, yearOfRelease: Int, engine: Engine, window: Window, trunk: Trunk, privod: Int) {
        self.marka = marka
        self.yearOfRelease = yearOfRelease
        self.engine = engine
        self.window = window
        self.trunk = trunk
        self.privod = privod
    }
    func privodCar () {
        print("\(privod) - Ведущих колес")
    }
    func trailerCar() {
      print("Прицеп")
    }
    
    
 }


class SportCar: Car, CustomStringConvertible {
    
    
    enum CarHatchState: String {
        case Yes = "Есть люк"
        case Not = "Нету люк "
    
    }
    
    var hatchState: CarHatchState
    override var description: String {
             return """
                Марка: \(marka)
                Год выпуска: \(yearOfRelease)
                Окна: \(window.rawValue)
                Двигатель: \(engine.rawValue)
                Гружоный: \(trunk.rawValue)
                Люк: \(hatchState.rawValue)
                Привод: \(privod)
                """
        }
    init(marka: String, yearOfRelease: Int, engine: Engine, window: Window, hatchState: CarHatchState, trunk: Trunk, privod: Int ) {
        self.hatchState = hatchState
        super.init(marka: marka, yearOfRelease: yearOfRelease, engine: engine, window: window, trunk: trunk, privod: privod)
    }
    override func privodCar() {
        if privod == 4{
            print ("\(marka) Машина спортивная")
            }
        else if privod == 2 {
            print("\(marka) Машина не спортивная")
        }
    }
}
    
    
class TrankCar: Car, CustomStringConvertible {
   
    enum Trailerstatus: String {
        case Yes = "Есть прицеп"
        case Not = "Нету прицепа"
    }
    override var description: String {
             return """
                Марка: \(marka)
                Год выпуска: \(yearOfRelease)
                Окна: \(window.rawValue)
                Двигатель: \(engine.rawValue)
                Гружоный: \(trunk.rawValue)
                Прицеп: \(trailer.rawValue)
                Привод: \(privod)
                """
        }
    var trailer: Trailerstatus
    init(marka: String, yearOfRelease: Int, engine: Engine, window: Window, trailer: Trailerstatus, trunk: Trunk, privod: Int) {
        self.trailer = trailer
       
        super.init(marka: marka, yearOfRelease: yearOfRelease, engine: engine, window: window, trunk: trunk, privod: privod)
    }
    
    override func trailerCar() {
        if trailer == .Yes {
        print ("\(marka) Грузовая машина")
            }
        else if trailer == .Not {
            print("\(marka) Не грузовая машина")
        }
    }
 
}

var sportCar1 = SportCar(marka: "Honda", yearOfRelease: 2020, engine: .On, window: .Open, hatchState: .Yes, trunk: .Not, privod: 2)
var sportCar2 = SportCar(marka: "BMW", yearOfRelease: 2021, engine: .Off, window: .Close, hatchState: .Not, trunk: .Not, privod: 4)

var trankCar1 = TrankCar(marka: "Volvo", yearOfRelease: 2000, engine: .On, window: .Open, trailer: .Yes, trunk: .Yes, privod: 2)
var trankCar2 = TrankCar(marka: "Ivtko", yearOfRelease: 2005, engine: .Off, window: .Close, trailer: .Yes, trunk: .Yes, privod: 4)

sportCar1.privodCar()
sportCar2.privodCar()
trankCar2.trailerCar()
trankCar1.trailerCar()



print(sportCar1)
print(sportCar2)
print(trankCar1)
print(trankCar2)

