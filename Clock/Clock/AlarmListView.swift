//
//  AlarmListView.swift
//  Clock
//
//  Created by HakuBill on 2021/01/18.
//

import SwiftUI

struct AlarmListView: View {
    @State private var isPresented = false
    
    var body: some View {
        VStack {
            NavigationView {
                List(alarmInfoData) { alarmInfo in
                    NavigationLink(
                        destination: AlarmDetail(alarmInfo: alarmInfo, currentID: alarmInfo.id, isNewAlarm: false)) {
                        AlarmView(alarmInfo: alarmInfo)
                    }
                }
                .navigationBarTitle(Text("Alarm List"),displayMode: .automatic)
                .navigationBarItems(trailing:
                    NavigationLink(
                        destination: AlarmDetail(alarmInfo: alarmInfoDataNew, currentID: curID, isNewAlarm: true), isActive: $isPresented) {
                        Image(systemName: "plus.circle")
                    }
                )
            }
        }
    }
}

struct AlarmListView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmListView()
    }
}
