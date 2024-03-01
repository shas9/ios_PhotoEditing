//
//  CustomButton.swift
//  PhotoWizard
//
//  Created by Shahwat Hasnaine on 2/3/24.
//

import SwiftUI

struct CustomButton: View {
    
    
    
    let buttonText: String
    let buttonType: ButtonType
    let buttonWidth: CGFloat
    let buttonHeight: CGFloat
    
    let buttonAction: () -> Void
    
    enum ButtonType {
        case normal
        case highlighted
    }
    
    init(text: String, type: ButtonType, width: CGFloat, height: CGFloat, action: @escaping () -> Void) {
        self.buttonText = text
        self.buttonType = type
        self.buttonWidth = width
        self.buttonHeight = height
        self.buttonAction = action;
    }

    var body: some View {
        Button {
            self.buttonAction()
        } label: {
            Text(self.buttonText)
                .foregroundColor(getButtonTextColor())
                .frame(width: self.buttonWidth, height: self.buttonHeight)
                .background(getButtonColor())
                .cornerRadius(12)
        }
        
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
    CustomButton(text: "Remove Background", type: .highlighted, width: 358, height: 40, action: {
        print("CustomButton Pressed")
    })
}
