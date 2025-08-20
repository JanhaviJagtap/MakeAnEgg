//
//  TapView.swift
//  Egg
//
//  Created by Janhavi Jagtap on 20/8/2025.
//

import SwiftUI

struct TapView: View {
    @State var cracked = false;
    @State var cooked = false;
    @State var img = "egg"
    
    let singleTapGesture = TapGesture()
    let doubleTapGesture = TapGesture(count: 2)
    let longPressGesture = LongPressGesture(minimumDuration: 2)
    let dragGesture = DragGesture(minimumDistance: 10)
    
    
    var tapGesture: some Gesture {        TapGesture()
            .onEnded {
                withAnimation {
                    cracked=true
                    img = "cracked egg"
                }
            }
    }
    var doubleTap: some Gesture {
        TapGesture(count: 2)
            .onEnded {
                withAnimation {
                    if(cracked){
                        cooked=true
                        img = "cooking egg"
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
                        cooked=false
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
            VStack{
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
                    .scaleEffect(cracked ? 1 : 0.4)
                    .padding(.bottom, 200)
                    .padding(.leading, 150)
                Spacer()
            }
        }
        
    }
}

#Preview {
    TapView()
}
