//
//  AlertView.swift
//  Clock
//
//  Created by HakuBill on 2020/12/02.
//

import SwiftUI

/*var alarmID: Int = 0

func GetID() {
    var currentID: Int
    alarmID = currentID
}*/

struct AlarmView: View {
    var alarmInfo: alarmInfoType
    var currentID: Int
    @State private var isOn = true
    var body: some View {
        VStack {
            Toggle(isOn: alarmInfo.$isOn, label: {
                HStack {
                    Image(systemName: "alarm")
                    Text(" \(alarmInfo.timeStr)")
                        .font(.system(size: 40))
                }
                
            })
            .frame(height: 75)
            HStack {
                Label(alarmInfo.name!, systemImage: "")
                    .frame(height: 30)
                    .font(.system(size: 20))
                    .foregroundColor(.gray)
                Spacer()
            }
        }
    }
}



struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AlarmView(alarmInfo: alarmInfoData[0], currentID: 0)
            AlarmView(alarmInfo: alarmInfoDataNew, currentID: 0)
        }
            .previewLayout(.fixed(width: 460, height: 105))
    }
}
