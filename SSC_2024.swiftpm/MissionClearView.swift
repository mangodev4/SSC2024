//
//  MissionClearView.swift
//  SSC_2024
//
//  Created by Yujin Son on 2/21/24.
//

import SwiftUI

struct MissionClearView: View {
    var body: some View {
        Text("Next Page")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(22)
    }
}

#Preview {
    MissionClearView()
}
