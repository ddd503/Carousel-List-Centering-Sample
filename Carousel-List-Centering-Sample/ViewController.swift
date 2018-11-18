//
//  ViewController.swift
//  Carousel-List-Centering-Sample
//
//  Created by kawaharadai on 2018/11/18.
//  Copyright © 2018 kawaharadai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(ContentViewCell.nib(), forCellReuseIdentifier: ContentViewCell.identifier)
            tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 30))
        }
    }
    
    let areaNameArray = ["オーストラリア", "グアム", "バリ", "ベトナム"]
    let imageNameArray = [["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"],
                          ["10", "11", "12", "13", "14", "15", "16", "17", "18", "19"],
                          ["20", "21", "22", "23", "24", "25", "26", "27", "28", "29"],
                          ["30", "31", "32", "33", "34", "35", "36", "37", "38", "39"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return areaNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContentViewCell.identifier, for: indexPath) as? ContentViewCell else {
            fatalError("cell is nil")
        }
        cell.setData(datasource: self, viewTag: indexPath.row, areaName: areaNameArray[indexPath.row])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 3
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNameArray[collectionView.tag].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CrouselViewCell.identifier, for: indexPath) as? CrouselViewCell else {
            fatalError("cell is nil")
        }
        cell.setImage(imageName: imageNameArray[collectionView.tag][indexPath.row])
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
