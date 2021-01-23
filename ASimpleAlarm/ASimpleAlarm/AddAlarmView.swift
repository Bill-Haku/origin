//
//  AddAlarmView.swift
//  ASimpleAlarm
//
//  Created by YZH on 2021/1/16.
//

import SwiftUI
import AVFoundation


struct AddAlarmView: View {
    @ObservedObject var globalContent: GlobalContent
   // @State private var setDate = Date()
   // @State private var isOn = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Please enter a time", selection: $globalContent.setDate, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .datePickerStyle(WheelDatePickerStyle())
                
             /*   Toggle("",isOn:$isOn)
                    .offset(x:-50)
 */
                Button {
                    self.globalContent.registerLocal()
                    //registerLocal()
                } label: {
                    Text("Confirmation of receipt of notification")
                }

                Spacer()
            }
            .navigationBarTitle(Text("Setting"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.globalContent.addAlarm()
                self.globalContent.scheduleLocal()
                //scheduleLocal()
                self.checkWhetherEqual()
                print(globalContent.alarmLabelArray)
            }) {
                Text("Save")
            })
            
            
        }
        
    }
    
    
    func checkWhetherEqual() {
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            print("Timer fired!")
            print("1")
            let now = Date()
            let nowDateComponents = Calendar.current.dateComponents([.hour, .minute], from: now)
            let nowDateHour = nowDateComponents.hour ?? 0
            let nowDateMinute = nowDateComponents.minute ?? 0
            
            let nowDateString = "\(nowDateHour)  :  \(nowDateMinute)"
            print("nowDateString: \(nowDateString)")
            
            if globalContent.alarmLabelArray.count != 0 {
                if nowDateString == globalContent.alarmLabelArray[0] {
                    print("time is now!!!!!!!")
                    playAudio()
                    timer.invalidate()
                }
            }
            
        }
    }
    
    
   func playAudio() {
        var music: AVAudioPlayer!
        
        let path = Bundle.main.path(forResource: "mc", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        
    
        do {
            print("music is here")
            music = try AVAudioPlayer(contentsOf: url)
            music?.play()
        } catch {
            // couldn't load file :(
        }
        
    }
    
    
    
    
    
    func registerLocal() {
        let center = UNUserNotificationCenter.current()

        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Yay!")
            } else {
                print("D'oh")
            }
        }
    }

    func scheduleLocal() {
        registerCategories()

        let center = UNUserNotificationCenter.current()

        // not required, but useful for testing!
        center.removeAllPendingNotificationRequests()

        let content = UNMutableNotificationContent()
        content.title = "Late wake up call"
        content.body = "The early bird catches the worm, but the second mouse gets the cheese."
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData": "fizzbuzz"]
        //content.sound = UNNotificationSound(named: UNNotificationSoundName("mc.mp3"))
        content.sound = UNNotificationSound.criticalSoundNamed(UNNotificationSoundName(rawValue: "MusicTest.m4a"))
        //content.sound = UNNotificationSound.default
        
        //var dateComponents = DateComponents()
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: globalContent.setDate)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        
        //dateComponents.hour = 10
        //dateComponents.minute = 30
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)


        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
    }

    func registerCategories() {
        let center = UNUserNotificationCenter.current()
        //center.delegate = self

        let show = UNNotificationAction(identifier: "show", title: "Tell me more…", options: .foreground)
        let category = UNNotificationCategory(identifier: "alarm", actions: [show], intentIdentifiers: [])

        center.setNotificationCategories([category])
    }
    
    
    
    

}

struct AddAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AddAlarmView(globalContent: GlobalContent())
    }
}
