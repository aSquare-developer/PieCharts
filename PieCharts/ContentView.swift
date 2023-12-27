//
//  ContentView.swift
//  PieCharts
//
//  Created by Artur Anissimov on 27.12.2023.
//

import SwiftUI
import Charts

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Chart {
                    ForEach(MockData.revenueStreams) { stream in
                        SectorMark(
                            angle: .value("Stream", stream.value),
                            innerRadius: .ratio(0.618),
                            outerRadius: stream.name == "Sponsors" ? 180 : 120,
                            angularInset: 1.0
                        )
                        .foregroundStyle(stream.color)
                        .cornerRadius(6)
                        .annotation(position: .overlay) {
                            Text("$\(Int(stream.value))")
                        }
//                        SectorMark(angle: .value("Stream", stream.value), angularInset: 2)
//                            .foregroundStyle(by: .value("Name", stream.name))
                    }
                }
                .chartLegend(.hidden)
                .frame(width: 300, height: 300)
            }
            .padding()
            .navigationTitle("Revenue")
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}

struct RevenueStream: Identifiable {
    let id = UUID()
    let name: String
    let value: Double
    let color: Color
}

struct MockData {
    static var revenueStreams: [RevenueStream] = [
        .init(name: "Adsense", value: 806, color: .teal),
        .init(name: "Courses", value: 17855, color: .pink),
        .init(name: "Sponsors", value: 4000, color: .indigo),
        .init(name: "Consulting", value: 2500, color: .purple)
    ]
}
