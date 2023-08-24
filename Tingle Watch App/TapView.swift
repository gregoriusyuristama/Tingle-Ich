//
//  TapView.swift
//  Tingle Watch App
//
//  Created by Azella Mutyara on 24/08/23.
//

import SwiftUI

struct TapView: View {
    @State private var rectangleSize: CGSize = CGSize(width: 50, height: 50)
    @State private var isTimerRunning = false
    
    var body: some View {
        Rectangle()
            .frame(width: rectangleSize.width, height: rectangleSize.height)
            .foregroundColor(Color.blue)
            .onAppear {
                startTimer()
            }
            .onTapGesture {
                resetTimer()
                withAnimation {
                    playHapticPattern()
                    rectangleSize = CGSize(width: rectangleSize.width + 20, height: rectangleSize.height + 20)
                }
            }
    }
    
    func playHapticPattern() {
        let hapticTypes: [WKHapticType] = [.click, .directionUp, .directionDown]
        
        for hapticType in hapticTypes {
            WKInterfaceDevice.current().play(hapticType)
            // Pause briefly between haptic types to simulate a pattern
            Thread.sleep(forTimeInterval: 0.01)
        }
    }
    
    func startTimer() {
        guard !isTimerRunning else { return }
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if rectangleSize.width > 50 {
                withAnimation {
                    rectangleSize = CGSize(width: rectangleSize.width - 10, height: rectangleSize.height - 10)
                    playHapticPattern()
                }
            }
        }
        isTimerRunning = true
    }
    
    func resetTimer() {
        isTimerRunning = false
    }
}

struct TapView_Previews: PreviewProvider {
    static var previews: some View {
        TapView()
    }
}
