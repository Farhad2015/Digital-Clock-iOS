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
                Text("Good Afternoon.").font(.subheadline).foregroundColor(.black)
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
