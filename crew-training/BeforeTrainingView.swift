//
//  BeforeTrainingView.swift
//  crew-training
//
//  Created by 齋藤有希 on 2022/05/10.
//

import SwiftUI

struct BeforeTrainingView: View {
    @State var moveToTrainingView : Bool = false
    @Binding var burger : Burger
    
    var body: some View {
        
        if(!moveToTrainingView){
            
            ZStack{
                Color.gray
                    .ignoresSafeArea()
                
                ZStack{
                    Color.white
                        
                    VStack{
                        Text(burger.name)
                            .foregroundColor(.black)
                        
                        Button(action: {
                            moveToTrainingView.toggle()
                        }){
                            Text("Game Start")
                                .foregroundColor(.accentColor)
                                .font(.title)
                            
                        }.padding()
                            .background(.red)
                    }
                }.padding()
            }
            
        }
        else{
            BunsSelectView(burger: $burger)
        }
    }
}


