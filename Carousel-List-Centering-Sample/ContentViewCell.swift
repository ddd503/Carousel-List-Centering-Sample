//
//  ContentViewCell.swift
//  Carousel-List-Centering-Sample
//
//  Created by kawaharadai on 2018/11/18.
//  Copyright © 2018 kawaharadai. All rights reserved.
//

import UIKit

class ContentViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var areaNameLabel: UILabel!
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(CrouselViewCell.nib(), forCellWithReuseIdentifier: CrouselViewCell.identifier)
    }
    
    func setData(datasource: UICollectionViewDataSource & UICollectionViewDelegate, viewTag: Int, areaName: String) {
        collectionView.dataSource = datasource
        collectionView.delegate = datasource
        collectionView.tag = viewTag
        areaNameLabel.text = areaName
    }
    
}
