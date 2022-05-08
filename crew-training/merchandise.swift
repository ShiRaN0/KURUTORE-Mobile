//
//  merchandise.swift
//  crew-training
//
//  Created by 齋藤有希 on 2022/05/08.
//

import Foundation

//as MakerInterface
protocol addable{
    
}

enum Buns:addable{
    case Regular
    case Sesame
    case BigMac
    case PoppySeed
    case Tatsuta
    case rice
}

enum Method:addable{
    case bake
    case steam_8sec
    case steam_12sec
}

enum Wrap:addable{
    case normal
    case supachiki
    case samurai_blue
    case samurai_red
}

enum Pracement:addable{
    case vertical
    case horizontal
}



protocol foundation{
    
    var name : String{set get}
    var toppingList:[addable]{get set}
    
    func getToppingList()->[addable]
}



class Burger : foundation{
    var name:String
    var toppingList: [addable] = []
    
    init(name:String){
        self.name = name
    }
    
    func addTopping(topping:addable){
        toppingList.append(topping)
    }
    
    func getToppingList() -> [addable] {
        return toppingList
    }
}
