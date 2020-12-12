//
//  ClockApp.swift
//  Clock
//
//  Created by HakuBill on 2020/11/24.
//

import SwiftUI

struct alarmInfoType: Hashable, Codable, Identifiable {
    var isOn: Bool? = true
    var id: Int = 1
    var timeHr: Int = 9
    var timeMin: Int = 0
    var name: String? = "Get up!!"
}

var alarmNum = 2
var curID = 0
let alarmInfoData = [alarmInfoType](repeating: alarmInfoType(isOn: true, id: 0, timeHr: 7, timeMin: 20, name: "Get up"), count: alarmNum)

@main
struct ClockApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
