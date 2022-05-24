//
//  ContentView.swift
//  crew-training
//
//  Created by 齋藤有希 on 2022/05/07.
//

import SwiftUI

struct TopView: View {
    
    @State var burgers:[Burger] = jsonParse(fileName: "BurgerData.json")
   
    init(){
        UITabBar.appearance().barTintColor = UIColor.red
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        UITabBar.appearance().backgroundColor = UIColor.red
    }
    
    var body: some View {
        
        TabView{
            HomeView(burgers: $burgers)
                .tabItem(){
                    Image(systemName: "house")
                    Text("Home")
                }
            ManualView()
                .tabItem(){
                    Image(systemName: "book.fill")
                    Text("Manual")
                }
            RecipeView()
                .tabItem(){
                    Image(systemName: "bookmark.fill")
                    Text("Recipe")
                }
        }
    }
    
    
    /// 引数で指定したJSONファイルをパースしてreturnする。
    /// - Parameter fileName: JSONファイル名
    /// - Returns: オブジェクト化されたデータの配列
    private static func jsonParse(fileName:String) ->[Burger]{
        
        ///プロジェクト内にあるjSONファイルのパス取得
        guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            fatalError("ファイルが見つかりません")
        }
         
        ///jSONファイルの内容をData型プロパティに読み込み
        guard let data = try? Data(contentsOf: url) else {
            fatalError("ファイル読み込みエラー")
        }
         
        ///JSONデコード処理
        let decoder = JSONDecoder()
        guard let burgers = try? decoder.decode([Burger].self, from: data) else {
            fatalError("JSON読み込みエラー")
        }
         
        return burgers
    }
    
}


struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
            .previewInterfaceOrientation(.portrait)
        
    }
}
