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


enum Pracement:addable{
    case vertical
    case horizontal
}

enum Topping:addable{
    case mustard
    case ketchup
    case onion
    case pickles
    case sliced_onion
    case tomato
    case sliced_lettuce
    case shred_lettuce
    case cheese
    case white_cheese
    case bacon
    case egg
    case grilled_sauce
    case spicy_sauce
    case big_mac_sauce
    case phileo_sauce
    case yellow_mustard
    case tartar_sauce
    case sweet_lemon_sauce
    case ten_one
    case six_one
    case chicken
    case crisp
    case shrimp
    case fish
}

enum Burger_name:addable{
    case ハンバーガー
    case チーズバーガー
    case てりやきバーガー

    
//Json内のバーガーの数でHomeViewのリストを使うため不要
//    // TODO: - implements Caselterable -
//    static let BurgerElements:[Burger_name] = [.ハンバーガー,.チーズバーガー,.てりやきバーガー]
//    static func PrintPropertiesLength() -> Int {
//        return BurgerElements.count
//    }
}

protocol Menu{
    
    var name : Burger_name{set get}
    var toppingList:[Topping]{get set}
    
    func getToppingList()->[addable]
}


class BurgerClass : Menu{
    
    var name:Burger_name
    var buns:Buns
    var method:Method

    var wrap:Burger_name

    var pracement:Pracement
    var toppingList: [Topping] = []

    init(burgerName:String){
        // TODO: - HomeでパースされたJsonデータの"name"によって初期化の値を変える-
    }
    
    func addTopping(topping:Topping){
        toppingList.append(topping)
    }

    func getToppingList() -> [addable] {
        return toppingList
    }
}
