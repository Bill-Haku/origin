//
//  AlarmDetail.swift
//  Clock
//
//  Created by HakuBill on 2020/12/03.
//

import SwiftUI

struct AlarmDetail: View {
    var body: some View {
        HStack {
            Picker(selection: .constant(1), label: Text("Time"), content: {
                Text("AM").tag(1)
                Text("PM").tag(2)
            })
            Picker(selection: .constant(1), label:
                Text("hours")) {
                    Text("0").tag(1)
                    Text("1").tag(2)
                    Text("2").tag(3)
                    Text("3").tag(4)
                    Text("4").tag(5)
                    Text("5").tag(6)
                    Text("6").tag(7)
                    Text("7").tag(8)
                    Text("8").tag(9)
                    Text("9").tag(10)
//                    Text("10").tag(11)
//                    Text("11").tag(12)

            }
            Picker(selection: .constant(1), label: Text("minutes")) {
                    Text("1").tag(1)
                    Text("2").tag(2)
            }
        }
    }
}

struct AlarmDetail_Previews: PreviewProvider {
    static var previews: some View {
        AlarmDetail()
    }
}
