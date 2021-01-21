//
//  AlarmListView.swift
//  Clock
//
//  Created by HakuBill on 2021/01/18.
//

import SwiftUI

struct AlarmListView: View {
    @State private var isSheetPresented = false
    @ObservedObject var alarmInfoData = alarmInfoClass(isOn: true, timeStr: "0:0", name: "")
    //var alarmInfo: alarmInfoClass
    var currentID: Int = curID
    @State private var dueDate = Date()
    @State private var alarmName = ""
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_GB")
        formatter.dateFormat = "HH:mm"
        return formatter
    }
    
    var mainView: some View {
        return NavigationView {
            VStack {
                List(alarmInfoDatas.indices, id: \.self) { index in
                    NavigationLink(
                        destination: AlarmDetail(alarmInfo: alarmInfoDatas[index], currentID: index)) {
                        AlarmView(currentID: index, alarmInfo: alarmInfoDatas[index])
                    }
                }
                .navigationBarTitle(Text("Alarm List"),displayMode: .automatic)
                .navigationBarItems(trailing:
                    Button(action: {
                        self.isSheetPresented = true
                    }, label: {
                        Text("Add New")
                        Image(systemName: "plus.circle")
                            .sheet(isPresented: $isSheetPresented) {
                                VStack{
                                    AlarmDetail(alarmInfo: alarmInfoDataNew, currentID: curID)
                                    Button(action: {
                                        alarmNum += 1
                                        let calendar = Calendar.current
                                        let dateComponets1 = calendar.dateComponents(in: TimeZone.init(secondsFromGMT: 3600*8)!, from: dueDate)
                                        print("\(dateComponets1.year!)-\(dateComponets1.month!)-\(dateComponets1.day!) \(dateComponets1.hour!):\(dateComponets1.minute!)\n")
                                        let dateComponets2 = calendar.dateComponents([Calendar.Component.hour,Calendar.Component.minute], from: dueDate)
                                        
                                        let newAlarmInfoData: alarmInfoClass = alarmInfoDataNew
                                        newAlarmInfoData.timeStr = "\( dateComponets2.hour ?? 0):\( dateComponets2.minute ?? 0)"
                                        //newAlarmInfoData.id = currentID + 1
                                        newAlarmInfoData.isOn = true
                                        newAlarmInfoData.name = alarmName
                                        
                                        alarmInfoDatas.append(newAlarmInfoData)
                                        alarmInfoDatas.append(alarmInfoDataNew)
                                        
                                        isSheetPresented = false
                                    }, label: {
                                        Text("Save")
                                            .foregroundColor(.blue)
                                    })
                                }
                        }
                    })
                )
            }
        }
    }
    
    var body: some View {
        return mainView
    }
}

struct AlarmListView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmListView()
    }
}
