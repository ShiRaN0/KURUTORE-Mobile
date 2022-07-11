//
//  TrainingView.swift
//  crew-training
//
//  問題に関するViewを当ファイルにまとめて定義している。
//
//  Created by 齋藤有希 on 2022/05/23.
//

import SwiftUI
import AVFoundation


struct Tools{
    
    private static let correctSound = try!  AVAudioPlayer(data: NSDataAsset(name: "correct")!.data)
    private static let incorrectSound = try!  AVAudioPlayer(data: NSDataAsset(name: "incorrect")!.data)
    
    internal static func playSound(isCorrect:Bool){
        if (isCorrect){
            correctSound.play()
        }else{
            incorrectSound.play()
        }
    }
}
struct Symbol: Identifiable {
    let id = UUID()
    let image: String
    let name: String
}

struct BunsSelectView : View{
    
    @Binding var burger: Burger
    @State var isCorrect = false
    
    
    
    //FIXME: change image to burger
    let symbols = [Symbol(image: "drop.fill", name: "Regular"),
                   Symbol(image: "flame.fill", name: "Sesame"),
                   Symbol(image: "bolt.fill", name: "BigMac"),
                   Symbol(image: "leaf.fill", name: "PoppySeed"),
                   Symbol(image: "hare.fill", name: "Tatsuta"),
                   Symbol(image: "tortoise.fill", name: "rice")]
    
    
    var body: some View{
        
        if(isCorrect){
            ToppingMainView(burger: $burger)
            
        }else{
            
            let columns: [GridItem] = [GridItem(.adaptive(minimum: 150, maximum: 500))]
            
            //TODO: print "○" or "✗"
            VStack{
                Text("バンズを選択してください。")
                    .padding(.top)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(symbols) { symbol in
                            VStack {
                                Button(action:{
                                    if(symbol.name != burger.buns){
                                        Tools.playSound(isCorrect: false)
                                        isCorrect=false
                                    }else{
                                        Tools.playSound(isCorrect: true)
                                        isCorrect=true
                                    }
                                }){
                                    //TODO: add burger's Image
                                    //FIXME: change systemName to "burger's image Name"
                                    VStack{
                                        Image(systemName: symbol.image)
                                        //.resizable()
                                        //.scaledToFit()
                                            .foregroundColor(.red)
                                        Text(symbol.name)
                                    }.padding(.vertical)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        
        
    }
    
    
}

//TODO: トッピングすべてを選択したらフラグをtrueにする。
struct ToppingSelectView : View{
    
    @Binding var burger :Burger
    //TODO: change String to Topping(enum)
    @Binding var topping:String
    @State var isCorrect = false
    
    
    var body: some View{
        
        if isCorrect{
            Text("正解！")
        }else{
            
            let columns: [GridItem] = [GridItem(.adaptive(minimum: 150, maximum: 500))]
            
            
            
            //FIXME: change image to burger
            let symbols = [Symbol(image: "drop.fill", name: "mustard"),
                           Symbol(image: "flame.fill", name: "ketchup"),
                           Symbol(image: "bolt.fill", name: "onion"),
                           Symbol(image: "leaf.fill", name: "pickles"),
                           Symbol(image: "hare.fill", name: "cheese"),
                           Symbol(image: "tortoise.fill", name: "ten_one")]
            
            
            
            VStack{
                Text("バンズを選択してください。")
                    .padding(.top)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(symbols) { symbol in
                            VStack {
                                Button(action:{
                                    if(symbol.name != topping){
                                        Tools.playSound(isCorrect: false)
                                        isCorrect=false
                                    }else{
                                        Tools.playSound(isCorrect: true)
                                        isCorrect=true
                                    }
                                }){
                                    //TODO: add burger's Image
                                    //FIXME: change systemName to "burger's image Name"
                                    VStack{
                                        Image(systemName: symbol.image)
                                        //.resizable()
                                        //.scaledToFit()
                                            .foregroundColor(.red)
                                        Text(symbol.name)
                                    }.padding(.vertical)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        
    }
}

