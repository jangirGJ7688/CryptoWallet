//
//  ChartView.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 10/08/24.
//

import SwiftUI

struct ChartView: View {
    
    private let data: [Double]
    private let minY: Double
    private let maxY: Double
    private let lineColor: Color
    private let startingDate: Date
    private let endingDate: Date
    
    @State private var percentage: CGFloat = 0.0
    
    init(coin: CoinModel) {
        self.data = coin.sparklineIn7Days?.price ?? []
        minY = data.min() ?? 0.0
        maxY = data.max() ?? 0.0
        let priceChange = (data.first ?? 0) - (data.last ?? 0)
        lineColor = priceChange > 0 ? Color.green : Color.red
        endingDate = Date(dateString: coin.lastUpdated ?? "")
        startingDate = endingDate.addingTimeInterval(-7*24*60*60)
    }
    
    var body: some View {
        VStack {
            chartView
                .frame(height: 200)
                .background(chartBackground)
                .overlay(chartOverlay.padding(.horizontal,4), alignment: .leading)
            dateView
                .padding(.horizontal,4)
        }
        .font(.caption.bold())
        .foregroundStyle(Color.theme.secondaryText)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.linear(duration: 2.0)) {
                    percentage = 1.0
                }
            }
        }
    }
}

#Preview {
    ChartView(coin: Dev.getDevCoinModel())
}

extension ChartView {
    
    private var chartView: some View {
        GeometryReader { geometry in
            Path { path in
                for index in data.indices {
                    let xPosition = geometry.size.width / CGFloat(data.count) * CGFloat(index + 1)
                    let yAxis = maxY - minY
                    let yPosition = (1 - CGFloat((data[index] - minY) / yAxis)) * geometry.size.height
                    if index == 0 {
                        path.move(to: CGPoint(x: xPosition, y: yPosition))
                    }
                    path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                }
            }
            .trim(from: 0.0, to: percentage)
            .stroke(lineColor, style: StrokeStyle(lineWidth: 2, lineCap: .round,lineJoin: .round))
            .shadow(color: lineColor,radius: 10.0, x: 0.0, y: 10.0)
            .shadow(color: lineColor.opacity(0.5),radius: 10.0, x: 0.0, y: 20.0)
            .shadow(color: lineColor.opacity(0.2),radius: 10.0, x: 0.0, y: 30.0)
            .shadow(color: lineColor.opacity(0.1),radius: 10.0, x: 0.0, y: 40.0)
        }
    }
    
    private var chartBackground: some View {
        VStack {
            Divider()
            Spacer()
            Divider()
            Spacer()
            Divider()
        }
    }
    
    private var chartOverlay: some View {
        VStack {
            Text(maxY.formatWithAbservation())
            Spacer()
            Text(((minY+maxY)/2).formatWithAbservation())
            Spacer()
            Text(minY.formatWithAbservation())
        }
    }
    
    private var dateView: some View {
        HStack {
            Text(startingDate.asShortDateString())
            Spacer()
            Text(endingDate.asShortDateString())
        }
    }
}
