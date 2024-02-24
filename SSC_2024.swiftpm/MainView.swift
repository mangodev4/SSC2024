//
//  ButtonColorTestView.swift
//  SSC_2024
//
//  Created by Yujin Son on 2/21/24.
//

import SwiftUI

struct MainView: View {
    struct ButtonData {
        var text: String
        var color: Color
        var isClicked: Bool
        var destination: AnyView
    }
    
    @State private var buttonDataArray: [ButtonData] = [
        ButtonData(text: "Eyes", color: .orange, isClicked: false, destination: AnyView(EyesDetailView())),
        ButtonData(text: "Nose", color: .orange, isClicked: false, destination: AnyView(NoseDetailView())),
        ButtonData(text: "Mouth", color: .orange, isClicked: false, destination: AnyView(MouthDetailView())),
        ButtonData(text: "Ears", color: .orange, isClicked: false, destination: AnyView(EarsDetailView())),
        ButtonData(text: "Fur", color: .orange, isClicked: false, destination: AnyView(FurDetailView())),
        ButtonData(text: "Foot", color: .orange, isClicked: false, destination: AnyView(FootDetailView())),
        ButtonData(text: "Tail", color: .orange, isClicked: false, destination: AnyView(TailDetailView())),
        
    ]
    
    @State private var showNextPageButton: Bool = false
    //    @State private var selectedDestination: AnyView? = nil
    @State private var allButtonsClicked: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.yellow
                    .ignoresSafeArea()
                
                VStack{
                    VStack(spacing: 15) {
                        ForEach(0..<buttonDataArray.count, id: \.self) { index in
                            NavigationLink(destination: buttonDataArray[index].destination, isActive: $buttonDataArray[index].isClicked) {
                                EmptyView()
                            }
                            .hidden()
                            
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
                    .padding(.top, 100)
                    .padding(.trailing, 210) // Optional padding for better visual appearance
                    
                    
                    Spacer() // Add spacer to push buttons to the top
                    
                }
            }
        }
    }
                
                
                
                //                if allButtonsClicked {
                //                    NavigationLink(destination: MissionClearView(), isActive: $allButtonsClicked) {
                //                        EmptyView()
                //                    }
                //                    .hidden()
                //
                //                    Button(action: {
                //                        // Action for the next page button
                //                        allButtonsClicked = true
                //                    }) {
                //                        Text("Next Page")
                //                            .foregroundColor(.white)
                //                            .padding()
                //                            .frame(maxWidth: .infinity)
                //                            .background(Color.red)
                //                            .cornerRadius(22)
                //                    }
                //                    .padding(.horizontal, 10)
                //                    .padding(.top, 700)
                //                }
                //            }
                //            .navigationTitle("") // Set your navigation title here
                //        }
                //        .onAppear {
                //            allButtonsClicked = buttonDataArray.allSatisfy { $0.isClicked }
                //        }
                //    }
                
                private func buttonTapped(_ index: Int) {
                    if !buttonDataArray[index].isClicked {
                        buttonDataArray[index].color = .gray
                        buttonDataArray[index].isClicked = true
                        
                        // Check if all buttons are clicked
                        //           allButtonsClicked = buttonDataArray.allSatisfy { $0.isClicked }
                    }
                }
    }


#Preview {
    MainView()
}
