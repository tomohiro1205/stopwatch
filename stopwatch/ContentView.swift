//
//  ContentView.swift
//  stopwatch
//
//  Created by 木村朋広 on 2024/02/20.
//

import SwiftUI
struct ContentView: View {
    @State var timer: Timer? = nil
    @State var secondsElapsed: Double = 0.0
    var body: some View {
        VStack {
            Text(String(format: "%.1f", secondsElapsed))
                .font(Font(UIFont.monospacedDigitSystemFont(ofSize: 120, weight: .black)))
            ButtonView(buttonAction: { start() }, text: "Start", color: .green)
            ButtonView(buttonAction: { stop() }, text: "Stop", color: .red)
            ButtonView(buttonAction: { reset() }, text: "Reset", color: .gray)
        } //VStackここまで
        .padding()
    } //bodyここまで
    func start() {
        if  timer == nil{
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                secondsElapsed += 0.1
            }
        } //if
    }
    func stop() {
        if let time = timer {
            time.invalidate()
        }
        timer = nil
    }
    func reset() {
        if let time = timer {
            time.invalidate()
        }
        timer = nil
        secondsElapsed = 0
    }
}//ContentViewここまで

struct ButtonView: View {
    let buttonAction: () -> Void
    let text: String
    let color: Color

    var body: some View {
        Button {
            buttonAction()
        } label: {
            Text(text)
                .frame(maxWidth: 200)
                .padding(10)
                .background(color)
                .foregroundColor(.white)
                .cornerRadius(10)
                .font(.largeTitle)
        }
    }//bodyここまで
} //ButtonView ここまで

#Preview {
    ContentView()
}
