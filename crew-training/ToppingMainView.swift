//
//  BeforeTrainingView.swift
//  crew-training
//
//  Created by 齋藤有希 on 2022/05/10.
//

import SwiftUI
import CoreMedia

struct ToppingMainView: View {
    @State var moveToTrainingView : Bool = false
    @Binding var burger : Burger
    
    //MEMO: bool配列を保持して、すべての要素がtrueになったらmoveToTrainingViewをtrueにして画面遷移？
    
    //    @State var isCorrectForToppings:[Bool]
    //    init(){
    //        self.isCorrectForToppings = Array(repeating: false, count: burger.toppingList.count)
    //    }
    
    
    var body: some View {
        
        
        NavigationView{
            VStack{
                Color.brown.frame(width: 200, height: 100)
                List(0..<burger.toppingList.count) { index in
                    NavigationLink(destination: ToppingSelectView(burger:$burger,topping: $burger.toppingList[index])) {
                        
                        Text("トッピング　"+String(index+1))
                    }.listRowInsets(
                        EdgeInsets(top: 10,
                                   leading: 50,
                                   bottom: 10,
                                   trailing: 40
                                  )
                    )
                }
                .navigationTitle("トッピング選択").navigationBarTitleDisplayMode(.inline)
                
                Color.brown.frame(width: 200, height: 100)
            }
        }
    }
}


