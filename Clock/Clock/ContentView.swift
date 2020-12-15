//
//  ContentView.swift
//  Clock
//
//  Created by HakuBill on 2020/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationView {
                List(alarmInfoData) { alarmInfo in
                    NavigationLink(
                        destination: AlarmDetail(alarmInfo: alarmInfo, currentID: alarmInfo.id)) {
                        AlarmView(alarmInfo: alarmInfo)
                    }
                }
                .navigationBarTitle(Text("Alarm List"),displayMode: .automatic)
                .navigationBarItems(leading:  Button(action: {
                       print("Go to index page")
                   }) {
                       Text("Haku's Alarm")
                   }, trailing: TrailingButtons())
            }
        }
    }
}

struct TrailingButtons : View{
    @State private var showingPopup: Bool = false
    var body: some View {
        Button(action: {
            self.showingPopup.toggle()
        }) {
            Image(systemName: "plus.circle")
        }.popover(isPresented: self.$showingPopup) {
//            NavigationView {
                VStack(spacing: 20) {
                    HStack {
                        Button(action: {
                            self.showingPopup = false
                        }, label: {
                            Text("Cancel")
                        })
                        Spacer()
                        Button(action: {
                            alarmNum += 1
                            curID += 1
                            alarmInfoData.append(alarmInfoDataNew)
                            self.showingPopup = false
                        }, label: {
                            Text("Done")
                        })
                    }
                    .frame(height: 50)
                    Divider()
                    AlarmDetail(alarmInfo: alarmInfoDataNew, currentID: alarmInfoDataNew.id)
//                    HStack {
//                        Text("Choose the date and time here:")
//                            .font(.title2)
//                        Spacer()
//                    }
////                        .frame(height: 100)
//                    Divider()
//                    DatePicker(selection: .constant(Date()), label: { Text("New alarm:") })
////                        .frame(height: 200)
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.bottom)
            }
//            .navigationBarTitle(Text("Add new alarm"), displayMode: .inline)
        
//        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

