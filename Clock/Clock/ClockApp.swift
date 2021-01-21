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
    
    init(isOn: Bool, timeStr: String, name: String) {
        self.isOn = isOn
       // self.id = id
        self.timeStr = timeStr
        self.name = name 
    }
}

var alarmNum = 2
var curID = 0

var alarmInfo1 = alarmInfoClass(isOn: true, timeStr: "12:44", name: "alarm1")
var alarmInfo2 = alarmInfoClass(isOn: false, timeStr: "23:41", name: "alarm2")

var alarmInfoDataNew = alarmInfoClass(isOn: true, timeStr: "0:0", name: "")
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
