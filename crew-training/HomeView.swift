//
//  HomeView.swift
//  crew-training
//
//  Created by 齋藤有希 on 2022/05/09.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            List(1..<20) { index in
                NavigationLink(destination: Text("問題ページ")) {
                    HStack{
                        Image(systemName:"questionmark.circle")
                        VStack{
                            Text("\(index)行目")
                                
                            Text("hoge")
                            
                        }.padding(.leading)
                            
                    }
                }.listRowInsets(
                    EdgeInsets(top: 10,
                               leading: 50,
                               bottom: 10,
                               trailing: 40
                              )
                )
            }.navigationTitle("クルトレ").navigationBarTitleDisplayMode(.inline)
            
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
