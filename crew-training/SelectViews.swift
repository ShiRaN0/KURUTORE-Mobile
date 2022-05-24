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

struct BunsSelectView : View{
    
    @Binding var burger: Burger
    @State var bunsName:String = ""
    @State var moveToNextView = false
    
    
    struct Symbol: Identifiable {
        var id = UUID()
        var image: String
        var name: String
    }
    let symbols = [Symbol(image: "drop.fill", name: "Regular"),
                   Symbol(image: "flame.fill", name: "Sesame"),
                   Symbol(image: "bolt.fill", name: "BigMac"),
                   Symbol(image: "leaf.fill", name: "PoppySeed"),
                   Symbol(image: "hare.fill", name: "Tatsuta"),
                   Symbol(image: "tortoise.fill", name: "rice")]
    
    
    private let correctSound = try!  AVAudioPlayer(data: NSDataAsset(name: "correct")!.data)
    private let incorrectSound = try!  AVAudioPlayer(data: NSDataAsset(name: "incorrect")!.data)
    
    
    private func playSound(isCorrect:Bool){
        if (isCorrect){
            correctSound.play()
        }else{
            incorrectSound.play()
        }
    }
    
    var body: some View{
        if(!moveToNextView){
            let columns: [GridItem] = [GridItem(.adaptive(minimum: 100, maximum: 150))]
            
            //TODO: print "○" or "✗"
            VStack{
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(symbols) { symbol in
                            VStack {
                                Button(action:{
                                    if(symbol.name != burger.buns){
                                        playSound(isCorrect: false)
                                        moveToNextView=false
                                    }else{
                                        playSound(isCorrect: true)
                                        moveToNextView=true
                                    }
                                }){
                                    Image(systemName: symbol.image)
                                    Text(symbol.name)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        else{
            PracementSelectView(burger: $burger)
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


//struct TrainingView_Previews: PreviewProvider {
//    static var previews: some View {
//        TrainingView()
//    }
//}
