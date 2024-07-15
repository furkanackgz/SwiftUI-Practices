//
//  DatePickerBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 9.03.2024.
//

import SwiftUI

struct DatePickerBootcamp: View {
    
    @State var selection: Date = Date()
    private let startDate: Date = Date()
    private let endDate: Date = Calendar.current.date(from:  DateComponents(year: 2024, month: 8)) ?? Date()
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        VStack {
            Text(dateFormatter.string(from: selection))
                .font(.title)
            
            DatePicker(
                "Pick something",
                selection: $selection,
                in: startDate...endDate,
                displayedComponents: [
                    .date, .hourAndMinute
                ]
            )
            .datePickerStyle(
//                WheelDatePickerStyle()
//                GraphicalDatePickerStyle()
                CompactDatePickerStyle()
            )
            .tint(.orange)
            
        }
    }
}

#Preview {
    DatePickerBootcamp()
}
