//
//  ContentView.swift
//  Marathon-SwiftUI-PerfectRow
//
//  Created by Sergey Leontiev on 16.12.24..
//

import SwiftUI

struct ContentView: View {
    @State var isVertical = false
    private let spacing: CGFloat = 5
    private let count = 7
    
    var body: some View {
        GeometryReader { proxy in
            let proxyWidth = proxy.size.width
            let proxyHeight = proxy.size.height
            let size = isVertical
                ? proxyHeight / CGFloat(count)
                : (proxyWidth - spacing * CGFloat(count - 1)) / CGFloat(count)
            
            ForEach(0..<count, id: \.self) { index in
                Rectangle()
                    .fill(.blue)
                    .frame(width: size, height: size)
                    .cornerRadius(8)
                    .offset(
                        x: isVertical
                            ? (size - (proxyHeight - proxyWidth) / CGFloat(count - 1)) * CGFloat(index)
                            : CGFloat(index) * size + spacing * CGFloat(index),
                        y: isVertical
                            ? proxyHeight - size * (CGFloat(index) + 1)
                            : proxyHeight / 2 - size / 2
                    ).onTapGesture {
                        withAnimation {
                            isVertical.toggle()
                        }
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
