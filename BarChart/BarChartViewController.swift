//
//  ViewController.swift
//  BarChart
//
//  Created by alper on 8/28/17.
//  Copyright © 2017 alper. All rights reserved.
//

import UIKit

class BarChartViewController: UICollectionViewController {
    let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)

    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
    

}

