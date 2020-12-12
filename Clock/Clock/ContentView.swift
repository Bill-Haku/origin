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
                List(alarmInfoData) { alarmInfo in
                    NavigationLink(
                        destination: AlarmDetail(alarmInfo: alarmInfo)) {
//                        AlarmView(alarmInfo: alarmInfoData[0])
                        AlarmView(alarmInfo: alarmInfo)
                    }
                }
                .navigationBarTitle(Text("Alarm"),displayMode: .automatic)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
