//
//  AlertView.swift
//  Clock
//
//  Created by HakuBill on 2020/12/02.
//

import SwiftUI

//var alarmInfo = [alarmInfoType]()

struct AlarmView: View {
//    var alarmInfo = Array(repeating: alarmInfoType(), count: 100)
    var alarmInfo: alarmInfoType
    
    @State private var isOn = true
    var body: some View {
        HStack {
            HStack {
                Toggle(isOn: $isOn, label: {
                    Text("\(alarmInfo.timeHr) : \(alarmInfo.timeMin)")
                        .font(.system(size: 30))
                })
            }
        }
    }
}

struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmView(alarmInfo: alarmInfoData[0])
    }
}
