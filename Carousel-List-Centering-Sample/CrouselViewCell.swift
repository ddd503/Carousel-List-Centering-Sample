//
//  CrouselViewCell.swift
//  Carousel-List-Centering-Sample
//
//  Created by kawaharadai on 2018/11/18.
//  Copyright © 2018 kawaharadai. All rights reserved.
//

import UIKit

class CrouselViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    func setImage(imageName: String) {
        imageView.image = UIImage(named: imageName)!
    }

}
