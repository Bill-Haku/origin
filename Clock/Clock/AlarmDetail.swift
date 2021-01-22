//
//  AlarmDetail.swift
//  Clock
//
//  Created by HakuBill on 2020/12/03.
//

import SwiftUI

struct AlarmDetail: View {
    var alarmInfo: alarmInfoClass
    var currentID: Int
    @State private var dueDate = Date()
    @State private var alarmName = ""
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_GB")
        formatter.dateFormat = "HH:mm"
        return formatter
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Set the time of")
                        .font(.title)
                    Spacer()
                }
                .foregroundColor(.black)
                DatePicker("Alarm\(currentID): '\(alarmInfo.name)'", selection: $dueDate, displayedComponents: [.hourAndMinute])
                    .frame(height: 50)
                    .font(.title2)
                    .foregroundColor(.black)
                HStack {
                    Text("Alarm name: ")
                        .font(.title2)
                    TextField("Enter your alarm name", text: $alarmName)
                        .frame(height: 100)
                        .font(.title2)

                }
                .foregroundColor(.black)
                Spacer()
                //Text("\(dueDate, formatter: dateFormatter)")
                //Text(dueDate.description)

            }
        }
        .navigationBarTitle(Text("Set the alarm"), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            print(currentID)
            let calendar = Calendar.current
            let dateComponets1 = calendar.dateComponents(in: TimeZone.init(secondsFromGMT: 3600*8)!, from: dueDate)
            print("\(dateComponets1.year!)-\(dateComponets1.month!)-\(dateComponets1.day!) \(dateComponets1.hour!):\(dateComponets1.minute!)\n")
            let dateComponets2 = calendar.dateComponents([Calendar.Component.hour,Calendar.Component.minute], from: dueDate)
                
            alarmInfoDatas[currentID].timeStr = "\(dateComponets2.hour ?? 0):\(dateComponets2.minute ?? 0)"
            alarmInfoDatas[currentID].timeHour = dateComponets2.hour ?? 0
            alarmInfoDatas[currentID].timeMinute = dateComponets2.minute ?? 0
            alarmInfoDatas[currentID].isOn = true
            if alarmName != "" {
                alarmInfoDatas[currentID].name = alarmName
            }
            
            print(alarmInfoDatas[currentID].isOn)
            print(alarmInfoDatas[currentID].timeStr)
        }, label: {
            Text("Save")
        }))
    }
}

struct AlarmDetail_Previews: PreviewProvider {
    static var previews: some View {
        AlarmDetail(alarmInfo: alarmInfoDataNew, currentID: alarmNum+1)
    }
}
