//: [Previous](@previous)

import SwiftUI
import Charts
import PlaygroundSupport

struct ContentView: View {
    
    struct MonthlyHoursOfSunshine: Identifiable {
        var id = UUID()
        
        var date: Date
        var hoursOfSunshine: Double

        init(month: Int, hoursOfSunshine: Double) {
            let calendar = Calendar.autoupdatingCurrent
            self.date = calendar.date(from: DateComponents(year: 2020, month: month))!
            self.hoursOfSunshine = hoursOfSunshine
        }
    }

    @State var data: [MonthlyHoursOfSunshine] = [
        MonthlyHoursOfSunshine(month: 1, hoursOfSunshine: 74),
        MonthlyHoursOfSunshine(month: 2, hoursOfSunshine: 99),
        MonthlyHoursOfSunshine(month: 3, hoursOfSunshine: 62),
        MonthlyHoursOfSunshine(month: 4, hoursOfSunshine: 45),
        MonthlyHoursOfSunshine(month: 5, hoursOfSunshine: 23),
        MonthlyHoursOfSunshine(month: 6, hoursOfSunshine: 73),
        MonthlyHoursOfSunshine(month: 7, hoursOfSunshine: 23),
        MonthlyHoursOfSunshine(month: 8, hoursOfSunshine: 28),
        MonthlyHoursOfSunshine(month: 9, hoursOfSunshine: 62),
        MonthlyHoursOfSunshine(month: 10, hoursOfSunshine: 43),
        MonthlyHoursOfSunshine(month: 11, hoursOfSunshine: 28),
        MonthlyHoursOfSunshine(month: 12, hoursOfSunshine: 62)
    ]
        
    @State var monthCount = 12
    
    var body: some View {
        
        VStack {
            Chart() {
                
                ForEach(data) { shape in
                    
                    LineMark(x: .value("Month", shape.date),
                             y: .value("Hours of Sunshine", shape.hoursOfSunshine)
                    ).foregroundStyle(.red)
                    
                }
            }
            .padding()
            .frame(width: 200, height: 200)
            Button("修改内容") {
                self.monthCount += 1
                self.data.append(MonthlyHoursOfSunshine(month: monthCount, hoursOfSunshine: 37))
                
            }
            
        }
                
    }

}

PlaygroundPage.current.setLiveView(ContentView())

//: [Next](@next)
