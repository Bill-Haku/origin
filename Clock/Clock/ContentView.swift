//
//  ContentView.swift
//  Clock
//
//  Created by HakuBill on 2020/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationView {
//                List() { alarm in
//                    NavigationLink(destination:
//                        AlarmView(alarm: alarm)) {
//                        AlarmDetail()
//                    }
//                }
            }
            .navigationBarTitle(Text("Alarm"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
