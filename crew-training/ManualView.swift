//
//  ManualView.swift
//  crew-training
//
//  Created by 齋藤有希 on 2022/05/09.
//

import SwiftUI

struct ManualView: View {
    var body: some View {
        
        NavigationView{
            VStack{
                Text("navigation\nhogehoge")
                //ここに書いてね
            }
            
            .navigationTitle("Manual")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action:{}) {
                        Image(systemName: "gearshape")
                            .foregroundColor(.gray)
                    }
                }
                
            }
        }
    }
}

struct ManualView_Previews: PreviewProvider {
    static var previews: some View {
        ManualView()
    }
}
