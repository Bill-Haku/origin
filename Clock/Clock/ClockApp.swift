//
//  ClockApp.swift
//  Clock
//
//  Created by HakuBill on 2020/11/24.
//

import SwiftUI

struct alarm: Hashable, Codable {
    var isOn: Bool
    var id: Int
    var timehr: Int
    var timemin: Int
}

@main
struct ClockApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
