//
//  ClockApp.swift
//  Clock
//
//  Created by HakuBill on 2020/11/24.
//

import SwiftUI

struct alarmInfoType: Identifiable {
    @State var isOn: Bool
    var id: Int
    var timeHr: Int
    var timeMin: Int
    var timeStr: String
    var name: String?
}

class alarmInfoClass: ObservableObject {
    @Published var isOn: Bool
    //@Published var id = UUID()
    @Published var timeStr: String
    @Published var name: String
    @Published var timeHour: Int
    @Published var timeMinute: Int
    
    init(isOn: Bool, timeStr: String, name: String, timeHour: Int, timeMinute: Int) {
        self.isOn = isOn
       // self.id = id
        self.timeStr = timeStr
        self.name = name
        self.timeHour = timeHour
        self.timeMinute = timeMinute
    }
}

var alarmNum = 2
var curID = 0

var alarmInfo1 = alarmInfoClass(isOn: true, timeStr: "12:50", name: "alarm1", timeHour: 12, timeMinute: 50)
var alarmInfo2 = alarmInfoClass(isOn: false, timeStr: "23:41", name: "alarm2", timeHour: 23, timeMinute: 41)

var alarmInfoDataNew = alarmInfoClass(isOn: true, timeStr: "0:0", name: "",  timeHour: 0, timeMinute: 0)
var alarmInfoDatas: [alarmInfoClass] = [alarmInfo1, alarmInfo2]
//var alarmInfoData = [alarmInfoType](repeating: alarmInfoType(isOn: true, id: 0, timeHr: 7, timeMin: 20, timeStr: "07:30", name: "Get up"), count: alarmNum)
//var alarmInfoDataNew = alarmInfoType(isOn: true, id: curID, timeHr: 0, timeMin: 0, timeStr: "00:00", name: "New Alarm")


@main
struct ClockApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
