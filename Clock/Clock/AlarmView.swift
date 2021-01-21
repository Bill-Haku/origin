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
            HStack {
                Label(alarmInfo.name, systemImage: "")
                    .frame(height: 30)
                    .font(.system(size: 20))
                    .foregroundColor(.gray)
                Spacer()
                Text("\(currentID)")
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
