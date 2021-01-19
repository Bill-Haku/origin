//
//  ContentView.swift
//  Clock
//
//  Created by HakuBill on 2020/11/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            AlarmListView()
                .tabItem {
                    Image(systemName: "alarm")
                    Text("Alarm")
                }
            GameView()
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Game")
                }
            }
        .font(.headline)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

