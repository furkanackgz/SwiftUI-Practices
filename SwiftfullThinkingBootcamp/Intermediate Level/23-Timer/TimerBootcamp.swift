//
//  TimerBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 21.12.2024.
//

import SwiftUI

struct TimerBootcamp: View {
    
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    // Current time
    /*
    @State private var currentTime: String = ""
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }
     
     .onReceive(timer) { date in
         currentTime = dateFormatter.string(from: date)
     }
     
     */
    
    // Countdown
    /*
    @State private var countdown: String? = nil
    @State private var startNumber: Int = 10
     
     .onReceive(timer) { _ in
         if startNumber == 1 {
             countdown = "Wow!"
         } else {
             startNumber -= 1
         }
     }
    
    */
    
    // Countdown to Date
    /*
    private let futureDate: Date = Calendar.current.date(byAdding: .init(hour: 1), to: Date()) ?? Date()
    @State private var remaning: String = ""
     
     .onReceive(timer) { date in
         let diff = Calendar.current.dateComponents([.minute, .second], from: Date(), to: futureDate)
         let min = diff.minute ?? 0
         let sec = diff.second ?? 0
         remaning = "\(min):\(sec)"
     }
     */
    
    // Animation counter
    /*
    @State private var count: Int = 1
     */
    
    // Animation tab view
    @State private var selection: Int = 1
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .red],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            // Current time, Countdown, Countdown to Date
            /*
            Text(countdown ?? "\(startNumber)")
                .font(.system(size: 80, weight: .semibold, design: .rounded))
                .foregroundStyle(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
                .shadow(radius: 15)
             */
            
            // Animation counter
            /*
            HStack {
                Circle()
                    .offset(y: count == 1 ? -20 : 0)
                Circle()
                    .offset(y: count == 2 ? -20 : 0)
                Circle()
                    .offset(y: count == 3 ? -20 : 0)
            }
            .foregroundStyle(.white)
            .frame(width: 100)
             */
            
            // TabView 
            TabView(selection: $selection) {
                Rectangle()
                    .foregroundStyle(.blue)
                    .tag(1)
                Rectangle()
                    .foregroundStyle(.green)
                    .tag(2)
                Rectangle()
                    .foregroundStyle(.yellow)
                    .tag(3)
                Rectangle()
                    .foregroundStyle(.purple)
                    .tag(4)
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(height: 200)
        }
        .onReceive(timer) { _ in
            withAnimation(.easeInOut) {
                selection = selection == 4 ? 1 : selection + 1
            }
        }
    }
}

#Preview {
    TimerBootcamp()
}
