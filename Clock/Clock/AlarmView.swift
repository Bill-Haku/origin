//
//  AlertView.swift
//  Clock
//
//  Created by HakuBill on 2020/12/02.
//

import SwiftUI

//var alarmInfo = [alarmInfoType]()

struct AlarmView: View {
    
    @State private var ison = true
    var body: some View {
        HStack {
            HStack {
                Toggle(isOn: $ison, label: {
                    Text("\(alarmInfo.timehr) : \(alarmInfo.timemin)")
                        .font(.system(size: 30))
                })
            }
        }
    }
}

struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmView()
    }
}
