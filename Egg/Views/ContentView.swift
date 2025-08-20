//
//  ContentView.swift
//  Egg
//
//  Created by Janhavi Jagtap on 20/8/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("egg")
                //.imageScale(.medium)
                .resizable()
                .foregroundStyle(.tint)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
