//
//  SplashView.swift
//  crew-training
//
//  Created by 齋藤有希 on 2022/05/07.
//

import SwiftUI

struct SplashView: View {
    @State private var isLoading = true
    @State private var isPlayAnimation = false
    var body: some View {
        // TODO: - ローディング処理の実装 -
        if isLoading{
            ZStack{
                Color.red
                    .ignoresSafeArea()
                VStack{
                Image("Logo-Yellow")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height:300 )
                    .scaleEffect(isPlayAnimation ? 1.0:0.5)
                
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation(){
                        self.isPlayAnimation.toggle()
                    }
                }
               
            }
            //とりあえずロードをしたという体で仮実装
            .onTapGesture {
                isLoading=false
            }
        }
        else{
            TopView()
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
            .previewInterfaceOrientation(.portrait)
    }
}
