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
        
        Text("\(viewModel.hours == 0 ? "" : "\(viewModel.hours):" )\(viewModel.minutes > 9 ? "\(viewModel.minutes)" : "0\(viewModel.minutes)"):\(viewModel.seconds > 9 ? "\(viewModel.seconds)" : "0\(viewModel.seconds)")")
        
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
