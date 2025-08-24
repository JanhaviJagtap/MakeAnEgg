//
//  ContentView.swift
//  Egg
//
//  Created by Janhavi Jagtap on 20/8/2025.
//

import SwiftUI

struct ContentView: View {
    @State var cracked = false;
    @State var cooked = false;
    @State var egged = false;
    @State var img = "egg"
    @State private var stepText = "Tap on the egg to crack it!"
    
    let singleTapGesture = TapGesture()
    let doubleTapGesture = TapGesture(count: 2)
    let longPressGesture = LongPressGesture(minimumDuration: 2)
    let dragGesture = DragGesture(minimumDistance: 10)
    
    
    var tapGesture: some Gesture {        TapGesture()
            .onEnded {
                withAnimation {
                    cracked=true
                    if(!egged){
                        egged = true
                        img = "cracked egg"
                        stepText = "Double tap on the egg \nand get cooking!"
                    }
                }
            }
    }
    var doubleTap: some Gesture {
        TapGesture(count: 2)
            .onEnded {
                withAnimation {
                    if(cracked && !cooked){
                        cooked=true
                        img = "cooking egg"
                        stepText = "      Long press on the egg to cook!"
                    }
                }
            }
    }
    var longPress: some Gesture {
        LongPressGesture()
            .onEnded {_ in
                withAnimation {
                    if(cooked){
                        img = "cooked egg"
                        cracked = false
                        stepText = "Your egg is cooked!\nThats a beautiful omelette!"
                    }
                }
            }
    }
    var body: some View {
        ZStack{
            Image("bg")
                .resizable()
                .scaledToFill()
            Image("pan")
                .resizable()
                .scaledToFit()
                .rotationEffect(.degrees(-30))
                .frame(width: 700)
            VStack(alignment: .center){
                Text("Lets cook an Omelette!!")
                    .fontWeight(.heavy)
                    .foregroundStyle(.black)
                    .padding(20)
                    .font(.title2)
                
                Spacer()
                Image(img)
                //.imageScale(.medium)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .foregroundStyle(.tint)
                    .gesture(tapGesture)
                    .gesture(doubleTap)
                    .gesture(longPress)
                    .scaleEffect(egged ? 1 : 0.4)
                    .padding(.bottom, 175)
                    .padding(.leading, 150)
                Spacer()
                Text(stepText)
                    //.fontWeight(.heavy)
                    .foregroundStyle(.black)
                    .padding(20)
                    .padding(.horizontal, 60)
                    .font(.title3)
                    .multilineTextAlignment(.center)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
