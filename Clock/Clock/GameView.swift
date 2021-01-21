//
//  GameView.swift
//  Clock
//
//  Created by HakuBill on 2021/01/18.
//

import SwiftUI

struct GameView: View {
    @State var products = ["手机","电脑","水杯"]
        @State var pName:String = ""
        var body: some View {
            VStack{
                TextField("新商品:",text: self.$pName)
                Button(action:{
                    print("hello")
                    if (self.pName != "")
                    {
                        self.products.append(self.pName)
                        self.pName = ""

                    }

                }){
                    Text("添加一个商品")
                }

                List(products,id:\.self){ item in
                    Text(item)

                }

            }
        }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
