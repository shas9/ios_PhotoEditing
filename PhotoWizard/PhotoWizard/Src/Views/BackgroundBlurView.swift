//
//  BackgroundBlurView.swift
//  PhotoWizard
//
//  Created by Shahwat Hasnaine on 4/3/24.
//

import SwiftUI
import Vision
import CoreML
struct BackgroundBlurView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var blurAmount: Double = 0
    
    let image: UIImage

    init(image: UIImage) {
        self.image = image
        self.blurAmount = 50
    }
    
    var body: some View {
        GeometryReader { mainGeometry in
            VStack(spacing: 12) {
                HStack {
                    Button() {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image("BackMenuButton")
                    }
                    
                    Spacer()
                    
                    Text("Blur Background")
                        .font(.system(size: 18, design: .default))
                    
                    Spacer()
                    
                    Button() {
                        
                    } label: {
                        Image("PremiumIcon")
                    }
                }
                .frame(height: 72)
                .padding([.leading, .trailing], 16)
                
                Spacer()
                ZStack {
                    Rectangle()
                        .foregroundStyle(.black)
                    Image(uiImage: self.image)
                        .resizable()
                        .blur(radius: self.blurAmount)
                        .clipped()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: getImageHeight(displayHeight: mainGeometry.size.height))
                    
                    if let segmentedImage = self.image.segment() {
                        Image(uiImage: segmentedImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: getImageHeight(displayHeight: mainGeometry.size.height))
                    }
                }
                Spacer()
                
                VStack {
                    HStack {
                        Text("Blur Background")
                            .font(.system(size: 16))
                        Spacer()
                        Text("\(Int(blurAmount))")
                            .font(.system(size: 16))
                    }
                    .padding(.top, 16)
                    .padding(.bottom, 8)
                    
                    VStack(spacing: 12) {
                        Slider(value: $blurAmount,
                               in: 0...100)
                        
                        HStack {
                            Spacer()
                            CustomButton(text: "Next",
                                         type: .highlighted,
                                         width: 84,
                                         height: 40,
                                         action: {
                                
                            })
                        }
                    }
                    .padding([.top, .bottom], 12)
                    
                    Spacer()
                }
                .frame(height: 180)
                .padding([.leading, .trailing], 16)
            }
            .navigationBarHidden(true)
        }
    }
    
    func getImageHeight(displayHeight: CGFloat) -> CGFloat {
        return displayHeight - 72 - 180 - (12 * 2)
    }
}

#Preview {
    BackgroundBlurView(image: UIImage(systemName: "globe")!)
}
