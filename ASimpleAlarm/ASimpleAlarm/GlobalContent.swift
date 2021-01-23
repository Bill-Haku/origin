//
//  GlobalContent.swift
//  ASimpleAlarm
//
//  Created by YZH on 2021/1/18.
//

import SwiftUI
import UserNotifications

class GlobalContent: ObservableObject {
    @Published var alarmLabelArray = [String]()
    @Published var setDate = Date()
    @Published var nowDate = Date()
    @Published var isOnArray = [Bool]()
    //@Published var alarmView = [AlarmView]()
    //@Published var alarmLabelViewArray = [AlarmLabelView]()
    
    var timer: Timer?
    
    struct AlarmView {
        var str: String
        var isOn: Bool
    }
    
    
    struct AlarmLabelView : View {
        @State var name: String
        @State private var isOn = true
        
        var body: some View {
            ZStack {
                Text("\(name)")
                Toggle("",isOn: $isOn)
                    .offset(x:-50)
            }
        }
    }
    
    func addAlarm() {
        let components = Calendar.current.dateComponents([.hour, .minute], from: setDate)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        // let formatter = DateFormatter()
        // let dateString = formatter.string(from: setDate)
        let dateString = "\(hour)  :  \(minute)"
        
        // let addLabel = "7:30"
        alarmLabelArray.append(dateString)
        // alarmLabelArray.append(hour)
        
        //let someAlarmView = AlarmView(str: dateString, isOn: true)
        //alarmView.append(someAlarmView)
        
    }
    
    func checkWhetherEqual() {
        
        // let setDateComponents = Calendar.current.dateComponents([.hour, .minute], from: setDate)
        let nowDateComponents = Calendar.current.dateComponents([.hour, .minute], from: nowDate)
        
        // let setDateHour = setDateComponents.hour ?? 0
        // let setDateMinute = setDateComponents.minute ?? 0
        
        let nowDateHour = nowDateComponents.hour ?? 0
        let nowDateMinute = nowDateComponents.minute ?? 0
        
        let nowDateString = "\(nowDateHour)  :  \(nowDateMinute)"
        
        if alarmLabelArray.count != 0 {
            if nowDateString == alarmLabelArray[0] {
                
            }
        }
    }
    
    
    
    @objc func registerLocal() {
        let center = UNUserNotificationCenter.current()

        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Yay!")
            } else {
                print("D'oh")
            }
        }
    }

    @objc func scheduleLocal() {
        //registerCategories()
        
        let center = UNUserNotificationCenter.current()
        
        center.removeAllPendingNotificationRequests()

        let content = UNMutableNotificationContent()
        content.title = "Late wake up call"
        content.body = "The early bird catches the worm, but the second mouse gets the cheese."
        content.categoryIdentifier = "alarm"
        //content.userInfo = ["customData": "fizzbuzz"]
        //content.sound = UNNotificationSound(named: UNNotificationSoundName("mc.mp3"))
        content.sound = UNNotificationSound.criticalSoundNamed(UNNotificationSoundName(rawValue: "music.m4a"))
        //content.sound = UNNotificationSound.default
        
        //var dateComponents = DateComponents()
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: setDate)
        //let hour = components.hour ?? 0
        //let minute = components.minute ?? 0
        
        //dateComponents.hour = 10
        //dateComponents.minute = 30
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)


        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
    }

    func registerCategories() {
        let center = UNUserNotificationCenter.current()
        //center.delegate = self

        let show = UNNotificationAction(identifier: "show", title: "Tell me more…", options: .foreground)
        let category = UNNotificationCategory(identifier: "alarm", actions: [show], intentIdentifiers: [])

        center.setNotificationCategories([category])
    }


}
