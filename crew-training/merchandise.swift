//
//  merchandise.swift
//  crew-training
//
//  Created by 齋藤有希 on 2022/05/08.
//

import Foundation

//as MakerInterface
protocol addable:Codable{
    
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

}

protocol Menu{
    
    var name : Burger_name{set get}
    var toppingList:[Topping]{get set}
    
    func getToppingList()->[addable]
}


struct Burger :Codable{

    var name:String
    let buns:String
    let method:String
    let wrap:String
    let pracement:String
    let toppingList: [String]
    //TODO: add KVS
    //let kvs:String

}

/*とりあえずBurger Structで実装しているが、今後下記クラスを使用するかも*/
/*
struct Burger :Codable{

    let name:Burger_name
    let buns:Buns
    let method:Method
    let wrap:Burger_name
    let pracement:Pracement
    let toppingList: [Topping]

//    init(burgerName:String){
//        // TODO: - HomeでパースされたJsonデータの"name"によって初期化の値を変える-
//   //factoryパターン？使えそう
//    }

    func getToppingList() -> [addable] {
        return toppingList
    }
}
*/

