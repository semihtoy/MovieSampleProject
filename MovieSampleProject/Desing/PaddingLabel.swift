//
//  paddingLabel.swift
//  MovieSampleProject
//
//  Created by Xcode on 25.01.2020.
//  Copyright © 2020 Xcode. All rights reserved.
//
import UIKit
import Foundation
@IBDesignable public class PaddingLabel:UILabel {
    
    @IBInspectable var topInset: CGFloat = 0
    @IBInspectable var bottomInset: CGFloat = 0
    @IBInspectable var leftInset: CGFloat = 0
    @IBInspectable var rightInset: CGFloat = 0
    override public func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    override public var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                    height: size.height + topInset + bottomInset)
    }
}
