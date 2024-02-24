//
//  SplashView.swift
//  SSC_2024
//
//  Created by Yujin Son on 2/25/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack {
            Image("Splash_AppName")
                .resizable()
                .scaledToFit()
                .frame(width: 250)
                .padding(40)
        
            Text("SplashView Test")
                .foregroundStyle(.orange)
        }
    }
}

#Preview {
    SplashView()
}


