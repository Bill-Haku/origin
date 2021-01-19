//
//  AlarmDetail.swift
//  Clock
//
//  Created by HakuBill on 2020/12/03.
//

import SwiftUI

struct AlarmDetail: View {
    var alarmInfo: alarmInfoType
    var currentID: Int
    var isNewAlarm: Bool
    @State private var dueDate = Date()
    @State private var alarmName = ""
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_GB")
        formatter.dateFormat = "HH:mm"
        return formatter
    }
    
    func SetInitAlarmName() {
        if !isNewAlarm {
            alarmName = alarmInfo.name!
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Set the time of")
                        .font(.title)
                    Spacer()
                }
                DatePicker("Alarm: '\(alarmInfo.name!)'", selection: $dueDate, displayedComponents: [.hourAndMinute])
                    .frame(height: 50)
                    .font(.title2)
                HStack {
                    Text("Alarm name: ")
                        .font(.title2)
                    TextField("Enter your alarm name", text: $alarmName)
                        .frame(height: 100)
                        .font(.title2)

                }
                Spacer()
                Text("\(dueDate, formatter: dateFormatter)")
                Text(dueDate.description)

            }
        }
        .navigationBarTitle(Text("Set the alarm"), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            if isNewAlarm {
                alarmNum += 1
                let calendar = Calendar.current
                let dateComponets1 = calendar.dateComponents(in: TimeZone.init(secondsFromGMT: 3600*8)!, from: dueDate)
                print("\(dateComponets1.year!)-\(dateComponets1.month!)-\(dateComponets1.day!) \(dateComponets1.hour!):\(dateComponets1.minute!)\n")
                let dateComponets2 = calendar.dateComponents([Calendar.Component.hour,Calendar.Component.minute], from: dueDate)
                
                var newAlarmInfoData: alarmInfoType = alarmInfoDataNew
                newAlarmInfoData.timeStr = "\(String(describing: dateComponets2.hour)):\(String(describing: dateComponets2.minute))"
                newAlarmInfoData.id = currentID + 1
                newAlarmInfoData.isOn = true
                newAlarmInfoData.name = alarmName
                newAlarmInfoData.timeHr = dateComponets2.hour!
                newAlarmInfoData.timeMin = dateComponets2.minute!
                
                alarmInfoData.append(newAlarmInfoData)
                
                //print("\(newAlarmInfoData.timeStr)\n\(newAlarmInfoData.name)\n\(newAlarmInfoData.id)")
            }
            if !isNewAlarm {
                let calendar = Calendar.current
                let dateComponets1 = calendar.dateComponents(in: TimeZone.init(secondsFromGMT: 3600*8)!, from: dueDate)
                print("\(dateComponets1.year!)-\(dateComponets1.month!)-\(dateComponets1.day!) \(dateComponets1.hour!):\(dateComponets1.minute!)\n")
                let dateComponets2 = calendar.dateComponents([Calendar.Component.hour,Calendar.Component.minute], from: dueDate)
                
                alarmInfoData[currentID].timeStr = "\(dateComponets2.hour ?? alarmInfo.timeHr):\(dateComponets2.minute ?? alarmInfo.timeMin)"
                alarmInfoData[currentID].isOn = true
                if alarmName != "" {
                    alarmInfoData[currentID].name = alarmName
                }
                alarmInfoData[currentID].timeHr = dateComponets2.hour!
                alarmInfoData[currentID].timeMin = dateComponets2.minute!
                
            }
        }, label: {
            Text("Save")
        }))
    }
}

struct AlarmDetail_Previews: PreviewProvider {
    static var previews: some View {
        AlarmDetail(alarmInfo: alarmInfoDataNew, currentID: alarmInfoDataNew.id, isNewAlarm: true)
    }
}
