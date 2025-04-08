//
//  ContentView.swift
//  InteractiveUI
//
//  Created by Scholar on 4/8/25.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    @State private var favSnack = ""
    @State private var birthday = Date()
    @State private var presentAlert = false
    
    var body: some View {
        VStack {
            Text("Please complete this form.")
                .font(.title)
            TextField("Type your name here...", text: $name)
                .multilineTextAlignment(.center)
                .font(.title)
                .border(Color.gray, width: 1)
            TextField("Enter your favorite snack...", text: $favSnack)
                .multilineTextAlignment(.center)
                .font(.title)
                .border(Color.gray, width: 1)
            DatePicker(selection: $birthday, displayedComponents: [.date], label: { Text("Birthday") })
                .datePickerStyle(.graphical)
            Button("Submit") {
                presentAlert = true
            }
            .font(.title2)
            .buttonStyle(.borderedProminent)
            .tint(.purple)
        }
        .padding()
        .alert("Thanks!", isPresented: $presentAlert, actions: {
            Button("OK") {
                name = ""
                favSnack = ""
                birthday = Date()
            }
        }, message: {
            Text("Got it! \(name)'s favorite snack is \(favSnack) and their birthday is \(birthday.formatted(date: .long, time:.omitted)).")
        })
    }
}

#Preview {
    ContentView()
}
