//
//  Utilities.swift
//  NewApp
//
//  Created by MACBOOK on 15/11/21.
//

import Foundation
import UIKit

//MARK:- roundViewCorner
open class roundViewCorner: UIView {
    @IBInspectable var cornerRadius : CGFloat = 5
    @IBInspectable var topLeft: Bool = false
    @IBInspectable var topRight: Bool = false
    @IBInspectable var bottomLeft: Bool = false
    @IBInspectable var bottomRight: Bool = false
    override open func layoutSubviews(){
        var options = UIRectCorner()
        if topLeft {
            options = options.union(.topLeft)
        }
        if topRight {
            options = options.union(.topRight)
        }
        if bottomLeft {
            options = options.union(.bottomLeft)
        }
        if bottomRight {
            options = options.union(.bottomRight)
        }
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: options, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
