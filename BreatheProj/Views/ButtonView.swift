//
//  ButtonView.swift
//  BreatheProj
//
//  Created by Tymofii Bezverkhyi on 22.01.2025.
//

import SwiftUI

struct ButtonView: View {
    @ObservedObject var viewModel: ButtonViewModel
    var body: some View {
        Circle()
            .fill(Color.blue)
            .frame(width: 300, height: 300)
            .overlay{
                Text(viewModel.mainText)
                    .font(.largeTitle)
                Text(viewModel.descriptionText)
                    .font(.largeTitle)
            }
            .onTapGesture {
                if viewModel.status == .notStarted {
                    Task{
                        await viewModel.start()
                    }
                } else {
                    viewModel.stop()
                }
            }
        
        Text("\(viewModel.status)")
    }
}

#Preview {
    ButtonView(viewModel: ButtonViewModel(GlobalObjects[0]))
}
