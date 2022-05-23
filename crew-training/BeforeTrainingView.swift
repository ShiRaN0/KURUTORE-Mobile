//
//  BeforeTrainingView.swift
//  crew-training
//
//  Created by 齋藤有希 on 2022/05/10.
//

import SwiftUI

struct BeforeTrainingView: View {
    @Binding var burger : Burger
    
    var body: some View {
        
        ZStack{
            Color.gray
                .ignoresSafeArea()
            
            ZStack{
                Color.white
                VStack{
                    Text(burger.name).foregroundColor(.black)
                    Button(action: {
                        //TODO: Move to TrainingView
                        //use binding object(Struct)
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
}


