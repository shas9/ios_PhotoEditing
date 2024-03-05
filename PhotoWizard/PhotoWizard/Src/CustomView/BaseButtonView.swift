//
//  BaseButtonView.swift
//  PhotoWizard
//
//  Created by Shahwat Hasnaine on 5/3/24.
//

import SwiftUI

struct BaseButtonView: View {
    let buttonText: String
    let buttonType: ButtonType
    let buttonWidth: CGFloat
    let buttonHeight: CGFloat
    
    enum ButtonType {
        case normal
        case highlighted
    }
    
    init(text: String, type: ButtonType, width: CGFloat, height: CGFloat) {
        self.buttonText = text
        self.buttonType = type
        self.buttonWidth = width
        self.buttonHeight = height
    }

    var body: some View {
        Text(self.buttonText)
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(getButtonTextColor())
            .frame(width: self.buttonWidth, height: self.buttonHeight)
            .background(getButtonColor())
            .cornerRadius(12)
    }
    
    func getButtonTextColor() -> Color {
        switch self.buttonType {
        case .normal:
            return .black
        case .highlighted:
            return .white
        }
    }
    
    func getButtonColor() -> Color {
        switch self.buttonType {
        case .normal:
            return Color("ButtonColor")
        case .highlighted:
            return Color("HighlightedButtonColor")
        }
    }
}

#Preview {
    BaseButtonView(text: "Remove Background", type: .highlighted, width: 358, height: 40)
}
