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
        VStack {
            Toggle(isOn: $isOn, label: {
                Text("\(alarmInfo.timeHr) : \(alarmInfo.timeMin)")
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
        AlarmView(alarmInfo: alarmInfoData[0])
            .previewLayout(.fixed(width: 450, height: 105))
    }
}
