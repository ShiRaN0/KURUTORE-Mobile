//
//  ManualView.swift
//  crew-training
//
//  Created by 齋藤有希 on 2022/05/09.
//

import SwiftUI

struct ManualView: View {
    @State var isShowingSheet = false
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
                    Button(action:{self.isShowingSheet.toggle()}) {
                        Image(systemName: "gearshape")
                            .foregroundColor(.gray)
                    }.sheet(isPresented:$isShowingSheet ){
                        SettingView()
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
