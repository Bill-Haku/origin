//
//  ClockApp.swift
//  Clock
//
//  Created by HakuBill on 2020/11/24.
//

import SwiftUI

struct alarmInfoType: Identifiable{
    @State var isOn: Bool
    var id: Int
    var timeHr: Int
    var timeMin: Int
    var timeStr: String
    var name: String?
}

var alarmNum = 1
var curID = 0
var alarmInfoData = [alarmInfoType](repeating: alarmInfoType(isOn: true, id: 0, timeHr: 7, timeMin: 20, timeStr: "07:30", name: "Get up"), count: alarmNum)
var alarmInfoDataNew = alarmInfoType(isOn: true, id: curID, timeHr: 0, timeMin: 0, timeStr: "00:00", name: "New Alarm")

@main
struct ClockApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
