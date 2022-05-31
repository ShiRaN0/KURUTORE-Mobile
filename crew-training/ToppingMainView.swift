//
//  BeforeTrainingView.swift
//  crew-training
//
//  Created by 齋藤有希 on 2022/05/10.
//

import SwiftUI

struct ToppingMainView: View {
    @State var moveToTrainingView : Bool = false
    @Binding var burger : Burger
    
    
    var body: some View {
        
        Color.brown.frame(width: 200, height: 100)
        NavigationView{
            List(0..<burger.toppingList.count) { index in
                NavigationLink(destination: ToppingSelectView(burger:$burger)) {
                    
                    Text("トッピング　"+String(index+1))
                }.listRowInsets(
                    EdgeInsets(top: 10,
                               leading: 50,
                               bottom: 10,
                               trailing: 40
                              )
                )
            }
            .navigationTitle("トッピング選択").navigationBarTitleDisplayMode(.inline)
            
            
        }
        Color.brown.frame(width: 200, height: 100)
    }
}


