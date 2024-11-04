//
//  ContentView.swift
//  Onboarding
//
//  Created by Devis on 04/11/2024.
//

import SwiftUI

struct ContentView: View {
    
    var steps: Int
    @Binding var currentStep: Int
    
    var body: some View {
        HStack{
            ForEach(0..<steps, id: \.self){item in
                GeometryReader{ geo in
                    ZStack(alignment: .leading){
                        Capsule()
                            .frame(width: geo.size.width, height: 5)
                            .foregroundStyle(.gray.opacity(0.3))
                        Capsule()
                            .frame(width: currentStep >= item ? geo.size.width : 0, height: 5)
                            .animation(.easeOut, value: currentStep)
                    }
                }
            }
        }
        .frame(height: 6)
    }
}

#Preview {
    ContentView(steps: 5, currentStep: .constant(0))
}
