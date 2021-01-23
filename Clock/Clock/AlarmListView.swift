//
//  AlarmListView.swift
//  Clock
//
//  Created by HakuBill on 2021/01/18.
//

import SwiftUI

struct AlarmListView: View {
    @State private var isSheetPresented = false
    @State var alarmInfoDatass: [alarmInfoClass] = alarmInfoDatas
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
                List(alarmInfoDatass.indices, id: \.self) { index in
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
                                    //AlarmDetail(alarmInfo: alarmInfoDataNew, currentID: curID)
                                    VStack {
                                        Text(" ").font(.title)
                                        HStack {
                                            Text("Set the time of")
                                                .font(.title)
                                            Spacer()
                                        }
                                        .foregroundColor(.black)
                                        DatePicker("Alarm\(alarmNum): '\(alarmInfoDataNew.name)'", selection: $dueDate, displayedComponents: [.hourAndMinute])
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
                                    Button(action: {
                                        alarmNum += 1
                                        let calendar = Calendar.current
                                        let dateComponets1 = calendar.dateComponents(in: TimeZone.init(secondsFromGMT: 3600*8)!, from: dueDate)
                                        print("\(dateComponets1.year!)-\(dateComponets1.month!)-\(dateComponets1.day!) \(dateComponets1.hour!):\(dateComponets1.minute!)\n")
                                        let dateComponets2 = calendar.dateComponents([Calendar.Component.hour,Calendar.Component.minute], from: dueDate)
                                        
                                        let newAlarmInfoData: alarmInfoClass = alarmInfoDataNew
                                        newAlarmInfoData.timeStr = "\( dateComponets2.hour ?? 0):\( dateComponets2.minute ?? 0)"
                                        newAlarmInfoData.isOn = true
                                        newAlarmInfoData.name = alarmName
                                        
                                        alarmInfoDatass.append(newAlarmInfoData)
                                        alarmInfoDatas.append(newAlarmInfoData)
                                        
                                        isSheetPresented = false
                                    }, label: {
                                        Text("Save")
                                            .foregroundColor(.blue)
                                    })
                                }
                            }
                        }
                    }
                )
            )}
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
