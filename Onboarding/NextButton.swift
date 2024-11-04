//
//  NextButton.swift
//  Onboarding
//
//  Created by Devis on 04/11/2024.
//

import SwiftUI

struct NextButton: View {
    
    @State var show = false
    @Binding var currentStep: Int
    var color: Color
    var action:() -> Void
    
    var body: some View {
        ZStack{
            Group{
                Circle()
                    .frame(width: 300, height: 300)
                Circle()
                    .frame(width: 230, height: 230)
            }
            .foregroundColor(color)
            .opacity(0.15)
            Image(systemName: "arrow.right")
                .font(.largeTitle)
                .offset(x: -92, y: -40)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .bottomTrailing)
        .offset(x: 150, y: 150).scaleEffect(show ? 1 : 0, anchor: .bottomTrailing)
        .onTapGesture {
            action()
        }
        .onChange(of: currentStep) {oldValue, newValue in
            show.toggle()
            withAnimation(.linear(duration: 0.5)){
                show.toggle()
            }
        }
        .onAppear(){
            withAnimation{
                show.toggle()
            }
        }
    }
}

#Preview {
    NextButton(currentStep: .constant(0), color: .blue, action: {})
}
