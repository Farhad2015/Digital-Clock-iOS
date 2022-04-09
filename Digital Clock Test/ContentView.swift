//
//  ContentView.swift
//  Digital Clock Test
//
//  Created by Mahmudur Rahman on 9/4/22.
//

import SwiftUI

struct ContentView: View {
    @State var date = Date()
    var body: some View {
        ZStack {
            VStack {
                Text("\(timeString(date: date))").font(.system(size: 24)).foregroundColor(.blue).fontWeight(.bold).padding([.leading, .trailing], 20)
                    .onAppear {
                        let _ = self.updateTimer
                    }
                Text("\(greeting())").font(.subheadline).foregroundColor(.black)
            }
        }
    }
    
    var timeFormat: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss a"
        return formatter
    }
    
    func timeString(date: Date) -> String {
        let time = timeFormat.string(from: date)
        return time
    }
    
    var updateTimer: Timer{
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { tmr in
            self.date = Date()
        }
    }
    
    func greeting() -> String {
        var greet = ""
        let midNight0 = Calendar.current.date(bySettingHour: 0, minute: 00, second: 00, of: date)!
        let nightEnd = Calendar.current.date(bySettingHour: 3, minute: 59, second: 59, of: date)!
        let morningStart = Calendar.current.date(bySettingHour: 4, minute: 00, second: 0, of: date)!
        let morningEnd = Calendar.current.date(bySettingHour: 11, minute: 59, second: 59, of: date)!
        let noonStart = Calendar.current.date(bySettingHour: 12, minute: 00, second: 00, of: date)!
        let noonEnd = Calendar.current.date(bySettingHour: 16, minute: 59, second: 59, of: date)!
        let eveStart = Calendar.current.date(bySettingHour: 17, minute: 00, second: 00, of: date)!
        let eveEnd = Calendar.current.date(bySettingHour: 20, minute: 59, second: 59, of: date)!
        let nightStart = Calendar.current.date(bySettingHour: 21, minute: 00, second: 00, of: date)!
        let midNight24 = Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: date)!
        
        if ((date >= midNight0) && (nightEnd >= date)) {
                  greet = "Good Night."
             } else if ((date >= morningStart) && (morningEnd >= date)) {
                  greet = "Good Morning."
             } else if ((date >= noonStart) && (noonEnd >= date)) {
                  greet = "Good Afternoon."
             } else if ((date >= eveStart) && (eveEnd >= date)) {
                  greet = "Good Evening."
             } else if ((date >= nightStart) && (midNight24 >= date)) {
                  greet = "Good night."
             }

        
        return greet
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
