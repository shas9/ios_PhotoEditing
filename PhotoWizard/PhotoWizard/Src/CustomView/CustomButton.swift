//
//  CustomButton.swift
//  PhotoWizard
//
//  Created by Shahwat Hasnaine on 2/3/24.
//

import SwiftUI

struct CustomButton: View {
    
    let buttonText: String
    let buttonType: BaseButtonView.ButtonType
    let buttonWidth: CGFloat
    let buttonHeight: CGFloat
    
    let buttonAction: () -> Void
    
    init(text: String, type: BaseButtonView.ButtonType, width: CGFloat, height: CGFloat, action: @escaping () -> Void) {
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
            BaseButtonView(text: self.buttonText,
                             type: self.buttonType,
                             width: self.buttonWidth,
                             height: self.buttonHeight)
        }
    }
}

#Preview {
    CustomButton(text: "Remove Background", type: .highlighted, width: 358, height: 40, action: {
        print("CustomButton Pressed")
    })
}
