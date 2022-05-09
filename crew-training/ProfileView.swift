//
//  SwiftUIView.swift
//  crew-training
//
//  Created by 齋藤有希 on 2022/05/09.
//

import SwiftUI

struct ProfileView: View {
    @State var isShowingSheet = false
    var body: some View {
        NavigationView{
            VStack{
                Text("profile")
            }
            
            .navigationTitle("Profile")
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

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
