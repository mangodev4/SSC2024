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
    
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            
            VStack{
                VStack(spacing: 15) {
                    ForEach(0..<buttonDataArray.count, id: \.self) { index in
                        Button(action: {
                            buttonTapped(index)
                        }) {
                            Text(buttonDataArray[index].text)
                                .foregroundColor(.white)
                                .frame(width: 80, height: 13)
                                .padding()
                                .background(buttonDataArray[index].color)
                                .cornerRadius(22)
                        }
                    }
                }
                .padding(.top, 150)
                .padding(.trailing, 210) // Optional padding for better visual appearance
                
                
                Spacer() // Add spacer to push buttons to the top
                
            }
            
            if showNextPageButton {
                Button(action: {
                    // Action for the next page button
                }) {
                    Text("Next Page")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(22)
                }
                //            .buttonStyle(.borderedProminent)
                .padding(.horizontal, 10)
                .padding(.top, 700)
            }
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
                showNextPageButton = true
            }
        }
    }
}

#Preview {
    ButtonColorTestView()
}
