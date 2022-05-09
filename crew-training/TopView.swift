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
    }
    var body: some View {
       
        // TODO: - 一番下までスクロールするとTabBarの色が消えることの是非を考える -
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
