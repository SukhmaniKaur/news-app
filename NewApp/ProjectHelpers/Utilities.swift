//
//  Utilities.swift
//  NewApp
//
//  Created by MACBOOK on 15/11/21.
//

import Foundation
import UIKit
import SDWebImage

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

//MARK:- Loader
func showLoader()
{
    AppDelegate().sharedDelegate().showLoader()
}

// MARK: - removeLoader
func removeLoader()
{
    AppDelegate().sharedDelegate().removeLoader()
}

extension UIImageView{
    //MARK: - downloadCachedImage
    func downloadCachedImage(placeholder: String,urlString: String){
        //Progressive Download
        //This flag enables progressive download, the image is displayed progressively during download as a browser would do. By default, the image is only displayed once completely downloaded.
        //so this flag provide a better experience to end user
        let options: SDWebImageOptions = [.progressiveDownload,.scaleDownLargeImages]
        let placeholder = UIImage(named: placeholder)
        DispatchQueue.global().async {
            self.sd_setImage(with: URL(string: urlString), placeholderImage: placeholder, options: options) { (image, _, cacheType,_ ) in
                guard image != nil else {
                    return
                }
                //Loading cache images for better and fast performace
                guard cacheType != .memory, cacheType != .disk else {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                    return
                }
                DispatchQueue.main.async {
                    self.image = image
                }
                return
            }
        }
    }
}
