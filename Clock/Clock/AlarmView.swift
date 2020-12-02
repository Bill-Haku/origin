//
//  AlertView.swift
//  Clock
//
//  Created by HakuBill on 2020/12/02.
//

import SwiftUI

struct AlarmView: View {
    let alarm: alarm
    var body: some View {
        HStack {
            HStack {
                
                Label(alarm.name, systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)
            }
            Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
            }
        }
    }
}

struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AlarmView(alarm: alarmInfo[0])
        }
    }
}
