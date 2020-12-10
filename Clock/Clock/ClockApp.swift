//
//  ClockApp.swift
//  Clock
//
//  Created by HakuBill on 2020/11/24.
//

import SwiftUI

struct alarmInfoType: Hashable, Codable {
    var isOn: Bool = true
    var id: Int = 1
    var timehr: Int = 9
    var timemin: Int = 0
    var name: String = "Get up!!"
    func alarmInfoInit() {
        alarmInfo.name = "Get up!"
    }
}

//var alarmInfo = [alarmInfoType]() /*= load("AlarmInfo.json")*/
var alarmInfo = alarmInfoType()


//alarmInfo.append(alarmInfoType)
//func alarmInfoInit() {
////    let alarmInfo1: alarmInfoType
//    alarmInfo.append(contentsOf: alarmInfo)
//
//}


//func load<T: Decodable>(_ filename: String) -> T {
//    let data: Data
//
//    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//        else {
//            fatalError("Couldn't find \(filename) in main bundle.")
//    }
//
//    do {
//        data = try Data(contentsOf: file)
//    } catch {
//        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
//    }
//
//    do {
//        let decoder = JSONDecoder()
//        return try decoder.decode(T.self, from: data)
//    } catch {
//        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//    }
//}

@main
struct ClockApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
