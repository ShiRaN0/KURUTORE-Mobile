//
//  HomeView.swift
//  crew-training
//
//  Created by 齋藤有希 on 2022/05/09.
//

import SwiftUI

struct HomeView: View {
    @State var isShowingSheet = false
    @Binding var burgers:[Burger]
    
    var body: some View {
        
        NavigationView{
            List(0..<burgers.count) { index in
                NavigationLink(destination: BunsSelectView(burger:$burgers[index]).navigationBarBackButtonHidden(true)) {
                    
                    HStack{
                        Image(burgers[index].name)
                            .resizable()
                            .scaledToFit()
                            .frame(height:30)
                        
                        VStack(alignment:.leading){
                            Text(burgers[index].name)
                            //TODO: use KVS property in BurgerData
                            Text("KVS: "+burgers[index].kvs)
                                .font(.caption)
                        }.padding(.leading)
                        
                    }
                }.listRowInsets(
                    EdgeInsets(top: 10,
                               leading: 50,
                               bottom: 10,
                               trailing: 40
                              )
                )
            }
            .navigationTitle("クルトレ").navigationBarTitleDisplayMode(.inline)
            
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


