//
//  ContentView.swift
//  crew-training
//
//  Created by 齋藤有希 on 2022/05/07.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        
        
        NavigationView{
            List(1..<20) { index in
                NavigationLink(destination: Text("問題ページ")) {
                    Text("\(index)行目")
                }
            }.navigationTitle("クルトレ")
            
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button("Cancel") {}
                    }
                    ToolbarItemGroup(placement: .bottomBar){
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "house")
                        }
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "book")
                        }
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "person.circle")
                        }
                        Spacer()
                        
                    }
                }
        }
        
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
            .previewInterfaceOrientation(.portrait)
        
    }
}
