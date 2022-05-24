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

import SwiftUI

struct ContentView: View {
    @State var showingPopUp = false
    var body: some View {
        ZStack {
            Button(action: {
                withAnimation {
                    showingPopUp = true
                }
            }, label: {
                Text("操作ガイドを見る")
                    .padding()
                    
                    .foregroundColor(Color.white)
                    .background(Color.accentColor)
                    .cornerRadius(12)
                    //.overlay(RoundedRectangle(cornerRadius: 12)
                        //.stroke()
                    //)
            })
            
            if showingPopUp {
                PopupView(isPresent: $showingPopUp)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        //.background(Color.gray)
        .background(Color.white)
        .ignoresSafeArea()
    }
}


struct PopupView: View {
    @Binding var isPresent: Bool
    var body: some View {
        VStack(spacing: 50) {
            Text("遊び方")
                .font(Font.system(size: 18).bold())
            
            Image("icon")
                .resizable()
                .frame(width: 80, height: 180)
            
            //Text("Snorlax (Japanese: カビゴン Kabigon) is a Normal-type Pokemon. Snorlax is most popular Pokemon.")
                //.font(Font.system(size: 18))
            
            Button(action: {
                withAnimation {
                    isPresent = false
                }
            }, label: {
                Text("閉じる")
                    .padding()
                    
                    .foregroundColor(Color.white)
                    .background(Color.accentColor)
                    .cornerRadius(12)
            })
        }
        .frame(width: 280, alignment: .center)
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.gray)
        //.background(Color.white)
        .ignoresSafeArea()
    }
}

struct ManualView_Previews: PreviewProvider {
    static var previews: some View {
        //ManualView()
        ContentView()
    }
}
