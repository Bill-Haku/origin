//
//  AlertView.swift
//  Clock
//
//  Created by HakuBill on 2020/12/02.
//

import SwiftUI
import UserNotifications

/*var alarmID: Int = 0

func GetID() {
    var currentID: Int
    alarmID = currentID
}*/

struct AlarmView: View {
    var currentID: Int
    @ObservedObject var alarmInfo: alarmInfoClass = alarmInfoDatas[curID]
    //@State private var isOn = true
    var body: some View {
        VStack {
            Toggle(isOn: $alarmInfo.isOn, label: {
                HStack {
                    Image(systemName: "alarm")
                    Text(" \(alarmInfo.timeStr)")
                        .font(.system(size: 40))
                }
                
            })
            .frame(height: 75)
            .onReceive([self.$alarmInfo.$isOn].publisher.first(), perform: { _ in
                addNotification()
                if alarmInfo.isOn {
                    print("Alarm Set")
                }
                else {
                    print("Alarm off")
                }
            })
            HStack {
                Label(alarmInfo.name, systemImage: "")
                    .frame(height: 30)
                    .font(.system(size: 20))
                    .foregroundColor(.gray)
                Spacer()
            }
        }
    }
    
    func addNotification() {
        let center = UNUserNotificationCenter.current()

        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "\(alarmInfo.name)"
            //content.subtitle = prospect.emailAddress
            //content.sound = UNNotificationSound.default
            content.sound = UNNotificationSound.criticalSoundNamed(UNNotificationSoundName(rawValue: "AlarmSound.m4a"))
            //content.sound=[UNNotificationSound soundNamed:@"AlarmSound.m4a"]

            var dateComponents = DateComponents()
            dateComponents.hour = alarmInfo.timeHour
            dateComponents.minute = alarmInfo.timeMinute
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)

            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
            print("Set at \(dateComponents.hour ?? -1) : \(dateComponents.minute ?? -1)")
        }

        // more code to come
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
                print("Active")
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else {
                        print("D'oh")
                    }
                }
            }
        }
    }
}



struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AlarmView(currentID: 0, alarmInfo: alarmInfoDatas[0])
            AlarmView(currentID: 1, alarmInfo: alarmInfoDatas[1])
            AlarmView(currentID: 0, alarmInfo: alarmInfoDataNew)
        }
            .previewLayout(.fixed(width: 460, height: 105))
    }
}
