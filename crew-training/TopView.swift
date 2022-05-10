//
//  ContentView.swift
//  crew-training
//
//  Created by 齋藤有希 on 2022/05/07.
//

import SwiftUI

struct TopView: View {
    
    init(){
        UITabBar.appearance().barTintColor = UIColor.red
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        UITabBar.appearance().backgroundColor = UIColor.red
    }
    var body: some View {
        
        
        TabView{
            HomeView()
                .tabItem(){
                    Image(systemName: "house")
                    Text("Home")
                    
                }
            ManualView()
                .tabItem(){
                    Image(systemName: "book.fill")
                    Text("Manual")
                }
            ProfileView()
                .tabItem(){
                    Image(systemName: "person.circle")
                    Text("Profile")
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
