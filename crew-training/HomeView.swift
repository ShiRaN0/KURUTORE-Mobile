//
//  HomeView.swift
//  crew-training
//
//  Created by 齋藤有希 on 2022/05/09.
//

import SwiftUI

struct HomeView: View {
    @State var isShowingSheet = false
    @State var burgerNameList :[String] = ["aa","bb"]
    @State var burgerNameForBinding = "hoge"
    
    // TODO: - Jsonパース　-

    
    var body: some View {
        NavigationView{
            List(0..<burgerNameList.count) { index in
                NavigationLink(destination: Text(burgerNameList[index])) {
                    HStack{
                        Image(systemName:"questionmark.circle")
                        VStack{
                            Text(burgerNameList[index])
                            
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
