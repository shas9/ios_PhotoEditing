//
//  UIImageExtension.swift
//  PhotoWizard
//
//  Created by Shahwat Hasnaine on 4/3/24.
//

import SwiftUI
import MLImageSegmentationLibrary

extension UIImage {
     func segment() -> UIImage?{
        let analyzer: MLImageSegmentationAnalyzer = MLImageSegmentationAnalyzer.sharedInstance()
        let setting = MLImageSegmentationSetting()
        setting.exact = true
        setting.analyzerType = .body
        setting.scene = .foregroundOnly
        analyzer.setImageSegmentationAnalyzer(setting)
        let mlImageSeg = analyzer.analyse(MLFrame(image: self))
        let output = mlImageSeg.getForeground()
        return output
    }
}
