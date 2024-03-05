//
//  NavigationButton.swift
//  PhotoWizard
//
//  Created by Shahwat Hasnaine on 5/3/24.
//

import SwiftUI

struct NavigationButton: View {
    let buttonText: String
    let buttonType: BaseButtonView.ButtonType
    let buttonWidth: CGFloat
    let buttonHeight: CGFloat
    
    let destinationView: AnyView
    
    init(text: String, type: BaseButtonView.ButtonType, width: CGFloat, height: CGFloat, destination: some View) {
        self.buttonText = text
        self.buttonType = type
        self.buttonWidth = width
        self.buttonHeight = height
        self.destinationView = AnyView(destination);
    }

    var body: some View {
        NavigationLink {
            self.destinationView
        } label: {
            BaseButtonView(text: self.buttonText,
                             type: self.buttonType,
                             width: self.buttonWidth,
                             height: self.buttonHeight)
        }
    }
}
