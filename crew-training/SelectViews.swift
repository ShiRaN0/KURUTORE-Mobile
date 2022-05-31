//
//  TrainingView.swift
//  crew-training
//
//  Created by 齋藤有希 on 2022/05/23.
//

import SwiftUI
import AVFoundation

struct TrainingView: View {
    @Binding var burger : Burger
    var body: some View {
        VStack{
            Text(burger.name)
                .font(.largeTitle)
        }
    }
}

struct Tools{
    
    private static let correctSound = try!  AVAudioPlayer(data: NSDataAsset(name: "correct")!.data)
    private static let incorrectSound = try!  AVAudioPlayer(data: NSDataAsset(name: "incorrect")!.data)

    static func playSound(isCorrect:Bool){
        if (isCorrect){
            correctSound.play()
        }else{
            incorrectSound.play()
        }
    }
}


struct BunsSelectView : View{
    
    @Binding var burger: Burger
    @State var moveToNextView = false
    
    
    struct Symbol: Identifiable {
        let id = UUID()
        let image: String
        let name: String
    }
    let symbols = [Symbol(image: "drop.fill", name: "Regular"),
                   Symbol(image: "flame.fill", name: "Sesame"),
                   Symbol(image: "bolt.fill", name: "BigMac"),
                   Symbol(image: "leaf.fill", name: "PoppySeed"),
                   Symbol(image: "hare.fill", name: "Tatsuta"),
                   Symbol(image: "tortoise.fill", name: "rice")]
    
    

    var body: some View{
        
        if(moveToNextView){
            PracementSelectView(burger: $burger)
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
                                        moveToNextView=false
                                    }else{
                                        Tools.playSound(isCorrect: true)
                                        moveToNextView=true
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


struct PracementSelectView : View{
    
    @Binding var burger :Burger
    @State var pracementName:String = ""
    
    var body: some View{
        VStack{
            Text("pracement")
        }
    }
}

