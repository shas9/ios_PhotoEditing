//
//  HomeView.swift
//  PhotoWizard
//
//  Created by Shahwat Hasnaine on 2/3/24.
//

import SwiftUI
import PhotosUI

struct HomeView: View {
    @State var selectedItem: PhotosPickerItem?
    @State var selectedImage: UIImage?
    @State var showBlurView: Bool = false
    
    var body: some View {
        GeometryReader { mainGeometry in
            NavigationView {
                VStack(spacing: 12) {
                    HStack {
                        Button() {
                            
                        } label: {
                            Image("BurgerMenu")
                        }
                        
                        Spacer()
                        
                        Text("Welcome to")
                            .font(.system(size: 18, design: .default))
                        
                        Text(Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? "PhotoWizard")
                            .font(.system(size: 18, weight: .semibold, design: .default))
                        
                        Spacer()
                        
                        Button() {
                            
                        } label: {
                            Image("PremiumIcon")
                        }
                    }
                    .frame(height: 72)
                    .padding([.leading, .trailing], 16)
                    
                    Spacer()
                    Image("HomeContentImage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: getImageHeight(displayHeight: mainGeometry.size.height))
                        .clipped()
                    Spacer()
                    
                    VStack {
                        HStack {
                            Text("Choose your option")
                                .font(.system(size: 18, weight: .medium))
                            Spacer()
                        }
                        .padding(.top, 16)
                        .padding(.bottom, 8)
                        
                        GeometryReader { geometry in
                            VStack(spacing: 12) {
                                NavigationButton(text: "Remove Background",
                                                 type: .normal,
                                                 width: geometry.size.width,
                                                 height: 40,
                                                 destination: VStack {})
                                
                                PhotosPicker(selection: self.$selectedItem) {
                                    BaseButtonView(text: "Blur Background",
                                                   type: .normal,
                                                   width: geometry.size.width,
                                                   height: 40)
                                }
                                .onChange(of: self.selectedItem) { newValue in
                                    Task {
                                        if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                                            self.selectedImage = UIImage(data: data)
                                            self.showBlurView = true
                                        }
                                        print("Failed to load the image")
                                        self.selectedItem = nil
                                        
                                    }
                                }
                                
                            }
                            .padding([.top, .bottom], 12)
                        }
                        
                        Spacer()
                    }
                    .frame(height: 200)
                    .padding([.leading, .trailing], 16)
                }
            }
            .sheet(isPresented: self.$showBlurView) {
                if let selectedImage {
                    BackgroundBlurView(image: selectedImage)
                }
            }
        }
    }
    
    func getImageHeight(displayHeight: CGFloat) -> CGFloat {
        return displayHeight - 72 - 200 - (12 * 2)
    }
}

#Preview {
    HomeView()
}
