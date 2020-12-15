//
//  ClockApp.swift
//  Clock
//
//  Created by HakuBill on 2020/11/24.
//

import SwiftUI

struct alarmInfoType: Hashable, Codable, Identifiable {
    var isOn: Bool = true
    var id: Int = 1
    var timeHr: Int = 9
    var timeMin: Int = 0
    var name: String? = "Get up!!"
}

var alarmNum = 1
var curID = 1
var alarmInfoData = [alarmInfoType](repeating: alarmInfoType(isOn: true, id: 0, timeHr: 7, timeMin: 20, name: "Get up"), count: alarmNum)
var alarmInfoDataNew = alarmInfoType(isOn: true, id: curID, timeHr: 0, timeMin: 0, name: "")

@main
struct ClockApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
