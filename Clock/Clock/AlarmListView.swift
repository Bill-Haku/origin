//
//  AlarmListView.swift
//  Clock
//
//  Created by HakuBill on 2021/01/18.
//

import SwiftUI

struct AlarmListView: View {
    var body: some View {
        VStack {
            OutOfControlView()
        }
    }
}

struct OutOfControlView: View {
    @State private var count: Int = 0
    @State private var isPresented = false

    var body: some View {
        DispatchQueue.main.async {
            self.count += 1
        }

        return NavigationView {
            VStack {
                List(alarmInfoData) { alarmInfo in
                    NavigationLink(
                        destination: AlarmDetail(alarmInfo: alarmInfo, currentID: alarmInfo.id, isNewAlarm: false)) {
                        AlarmView(alarmInfo: alarmInfo, currentID: alarmInfo.id)
                    }
                }
                .navigationBarTitle(Text("Alarm List"),displayMode: .automatic)
                .navigationBarItems(trailing:
                    NavigationLink(
                        destination: AlarmDetail(alarmInfo: alarmInfoDataNew, currentID: curID, isNewAlarm: true), isActive: $isPresented) {
                        Image(systemName: "plus.circle")
                    }
                )
                Text("\(self.count)")
            }
        }
    }
}

struct AlarmListView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmListView()
    }
}
