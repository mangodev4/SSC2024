//
//  ButtonColorTestView.swift
//  SSC_2024
//
//  Created by Yujin Son on 2/21/24.
//

import SwiftUI

struct ButtonColorTestView: View {
    struct ButtonData {
        var text: String
        var color: Color
        var isClicked: Bool
    }
    
    @State private var buttonDataArray: [ButtonData] = [
        ButtonData(text: "Eyes", color: .black, isClicked: false),
        ButtonData(text: "Nose", color: .black, isClicked: false),
        ButtonData(text: "Mouth", color: .black, isClicked: false),
        ButtonData(text: "Ears", color: .black, isClicked: false),
        ButtonData(text: "Fur", color: .black, isClicked: false),
        ButtonData(text: "Foot", color: .black, isClicked: false),
        ButtonData(text: "Tail", color: .black, isClicked: false),
        
    ]
    
    @State private var showNextPageButton: Bool = false
    @State private var isNavigationActive: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.yellow
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 20) {
                    ForEach(0..<buttonDataArray.count, id: \.self) { index in
                        Button(action: {
                            buttonTapped(index)
                        }) {
                            Text(buttonDataArray[index].text)
                                .foregroundColor(.white)
                                .frame(width: 80, height: 20)
                                .padding()
                                .background(buttonDataArray[index].color)
                                .cornerRadius(22)
                        }
                    }
                }
                .padding(.top, 80)
                .padding(.trailing, 210) // Optional padding for better visual appearance
                
                Spacer() // Add spacer to push buttons to the top
            }
            .navigationBarTitle("")
            .background(
                NavigationLink(
                    destination: MissionClearView(),
                    isActive: $isNavigationActive
                ) {
                    EmptyView()
                }
            )
        }
    }
    
    private func buttonTapped(_ index: Int) {
        if !buttonDataArray[index].isClicked {
            var updatedButtonDataArray = buttonDataArray
            updatedButtonDataArray[index].color = .blue
            updatedButtonDataArray[index].isClicked = true
            buttonDataArray = updatedButtonDataArray
            
            // Check if all buttons are clicked
            let allClicked = updatedButtonDataArray.allSatisfy { $0.isClicked }
            if allClicked {
                isNavigationActive = true
            }
        }
    }
}

#Preview {
    ButtonColorTestView()
}
