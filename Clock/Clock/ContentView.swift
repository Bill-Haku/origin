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
                .navigationBarTitle(Text("Alarm List"),displayMode: .automatic)
                .navigationBarItems(leading:  Button(action: {
                       print("Go to index page")
                   }) {
                       Text("Haku's Alarm")
                   }, trailing: TrailingButtons())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TrailingButtons : View{
    var body: some View {
        Button(action: {
            print("Edit the data")
        }) {
            Image(systemName: "livephoto")
        }
    }
}
