//
//  AlertView.swift
//  Clock
//
//  Created by HakuBill on 2020/12/02.
//

import SwiftUI

//var alarmInfo = [alarmInfoType]()

struct AlarmView: View {
    var alarmInfo: alarmInfoType
    
    @State private var isOn = true
    var body: some View {
        VStack {
            Toggle(isOn: $isOn, label: {
                Text(alarmInfo.timeStr)
                    .font(.system(size: 40))
            })
            .frame(height: 75)
            HStack {
                Label(alarmInfo.name!, systemImage: "")
                    .frame(height: 30)
                    .font(.system(size: 20))
                    .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                Spacer()
            }
        }
    }
}

struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AlarmView(alarmInfo: alarmInfoData[0])
            AlarmView(alarmInfo: alarmInfoData[0])
            AlarmView(alarmInfo: alarmInfoDataNew)
        }
            .previewLayout(.fixed(width: 450, height: 105))
    }
}
