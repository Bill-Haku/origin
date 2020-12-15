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
    @State private var date = Date()
    @State private var time = TIME_RELATIVE
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    alarmInfoData[currentID].timeHr = Int(DatePickerComponents.hourAndMinute.rawValue)
                }, label: {
                    Text("Save")
                })
            }
            HStack {
                Text("Set the date and time of")
                    .font(.title2)
                Spacer()
            }
            DatePicker("Alarm: '\(alarmInfo.name!)'", selection: $date, displayedComponents: [.hourAndMinute])
        }
    }
}

struct AlarmDetail_Previews: PreviewProvider {
    static var previews: some View {
        AlarmDetail(alarmInfo: alarmInfoDataNew, currentID: alarmInfoDataNew.id)
    }
}
