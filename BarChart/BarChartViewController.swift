//
//  ViewController.swift
//  BarChart
//
//  Created by alper on 8/28/17.
//  Copyright © 2017 alper. All rights reserved.
//

import UIKit

class BarChartViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let cellId = "cellId"
    let barChartWidth: CGFloat = 20
    let gapBetweenBars: CGFloat = 4
    
    let values: [CGFloat] = [200, 300, 400, 500, 200, 340, 222, 555, 333, 454, 777, 666, 665, 455, 665, 200, 300, 500, 600]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationController?.navigationBar.isHidden = true
        collectionView?.backgroundColor = .white
        (collectionView?.collectionViewLayout as! UICollectionViewFlowLayout).scrollDirection = .horizontal
        collectionView?.register(BarCell.self, forCellWithReuseIdentifier: cellId)

    }
    
    func maxHeight() -> CGFloat {
        return view.frame.height - 20 - 44 - 8
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return gapBetweenBars
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return values.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BarCell
        //get the max value of the numbers and find the ratio of them to fit all in the screan
        if let max = values.max() {
            let value = values[indexPath.item]
            let ratio = value / max
            cell.barHeightConstraint?.constant = maxHeight() * ratio
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: barChartWidth, height: maxHeight())
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
    }

}

