//
//  main.swift
//  7Kasperovich
//
//  Created by Дмитрий Касперович on 25.08.2021.
//

import Foundation

enum DepositCardErroor: Error {
    
    case incorrectPinCod (Pin: Int)
    case insufficientCodMoney (Money: Double)
    case frozzeCadr
}

struct thing {
    var price: Double
}

class DepositCardOperation {
    var balance: Double = 30000
    var PinCod: Int = 1234
    var BlockCard = false
    
    func buyThing(thing: thing) throws {
        if BlockCard {
        throw DepositCardErroor.frozzeCadr
        }
        guard PinCod == 1234 else {
            throw DepositCardErroor.incorrectPinCod(Pin: 1234)
        }
       
        guard thing.price <= (self.balance)  else {
                throw DepositCardErroor.insufficientCodMoney(Money: balance - thing.price)
            }
        
        balance = self.balance - thing.price
        
    }
    func depositCard(SomeMoney: Double) {
        balance = self.balance + SomeMoney
    }

    func balanceCard() {
        print("Баланс карты \(balance) рублей.")
    }
    
    func cardStatus(BlockCard: Bool){
        switch BlockCard {
        case true:
            self.BlockCard = true
            
        case false:
            self.BlockCard = false
        }
}
}

extension DepositCardErroor: CustomStringConvertible {
    var description: String {
        switch self {
        case .insufficientCodMoney (_): return "На карте недостаточно денег для проведения этой операции."
        case .frozzeCadr: return "Ваш карта по какой-то причине заморожена."
        case .incorrectPinCod(Pin: _): return "Не правильный пинкод, введите еще раз."
            
        }
    }
}
let operachion = DepositCardOperation()

operachion.balanceCard()

do {
    try operachion.buyThing(thing: .init(price: 10000))
}
catch let error as DepositCardErroor {
    print(error.description)
}
operachion.balanceCard()

operachion.depositCard(SomeMoney: 50000)

operachion.balanceCard()

do {
    try operachion.buyThing(thing: .init(price: 90000))
}
catch let error as DepositCardErroor {
    print(error.description)
}

operachion.balanceCard()

//operachion.cardStatus(BlockCard: true)
//operachion.PinCod = 1111

do {
    try operachion.buyThing(thing: .init(price: 11000))
}
catch let error as DepositCardErroor {
    print(error.description)
}
operachion.balanceCard()

operachion.cardStatus(BlockCard: true)
do {
    try operachion.buyThing(thing: .init(price: 10000))
}
catch let error as DepositCardErroor {
    print(error.description)
}
operachion.balanceCard()

operachion.cardStatus(BlockCard: false)

do {
    try operachion.buyThing(thing: .init(price: 10000))
}
catch let error as DepositCardErroor {
    print(error.description)
}
operachion.balanceCard()

operachion.PinCod = 1111
do {
    try operachion.buyThing(thing: .init(price: 10000))
}
catch let error as DepositCardErroor {
    print(error.description)
}
operachion.balanceCard()


operachion.PinCod = 1234
do {
    try operachion.buyThing(thing: .init(price: 10000))
}
catch let error as DepositCardErroor {
    print(error.description)
}
operachion.balanceCard()
