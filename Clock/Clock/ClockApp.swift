//
//  ClockApp.swift
//  Clock
//
//  Created by HakuBill on 2020/11/24.
//

import SwiftUI

class alarmInfoClass: ObservableObject {
    @Published var isOn: Bool
    @Published var timeStr: String
    @Published var name: String
    @Published var timeHour: Int
    @Published var timeMinute: Int
    
    init(isOn: Bool, timeStr: String, name: String, timeHour: Int, timeMinute: Int) {
        self.isOn = isOn
        self.timeStr = timeStr
        self.name = name
        self.timeHour = timeHour
        self.timeMinute = timeMinute
    }
}

var alarmNum = 2
var curID = 0

var alarmInfo1 = alarmInfoClass(isOn: true, timeStr: "23:57", name: "alarm1", timeHour: 23, timeMinute: 57)
var alarmInfo2 = alarmInfoClass(isOn: true, timeStr: "23:55", name: "alarm2", timeHour: 23, timeMinute: 55)

var alarmInfoDataNew = alarmInfoClass(isOn: true, timeStr: "0:0", name: "",  timeHour: 0, timeMinute: 0)
var alarmInfoDatas: [alarmInfoClass] = [alarmInfo1, alarmInfo2]

@main
struct ClockApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
