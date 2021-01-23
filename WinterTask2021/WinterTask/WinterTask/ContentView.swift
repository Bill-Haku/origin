//
//  ContentView.swift
//  WinterTask
//
//  Created by HakuBill on 2021/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FileManagementView()
                .tabItem {
                    Image(systemName: "folder")
                }
            WebBrowserView()
                .tabItem {
                    Image(systemName: "network")
                }
            MapView()
                .tabItem {
                    Image(systemName: "map")
                }
            UserInfoView()
                .tabItem {
                    Image(systemName: "person")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
