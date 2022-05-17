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

enum Topping:addable{
    case hoge
}

enum Burger:addable{
    case ハンバーガー
    case チーズバーガー
    case てりやきバーガー

    // TODO: - implements Caselterable -
    static let BurgerElements:[Burger] = [.ハンバーガー,.チーズバーガー,.てりやきバーガー]
    static func PrintPropertiesLength() -> Int {
        return BurgerElements.count
    }
}

protocol Menu{
    
    var name : Burger{set get}
    var toppingList:[Topping]{get set}
    
    func getToppingList()->[addable]
}



class BurgerClass : Menu{
    
    var name:Burger
    var buns:Buns
    var method:Method
    var wrap:Wrap
    var pracement:Pracement
    var toppingList: [Topping] = []

    init(){
        // TODO: - Jsonパース -
    }
    
    func addTopping(topping:Topping){
        toppingList.append(topping)
    }

    func getToppingList() -> [addable] {
        return toppingList
    }
}
