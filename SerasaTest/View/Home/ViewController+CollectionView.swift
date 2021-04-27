//
//  ViewController+CollectionView.swift
//  SerasaTest
//
//  Created by marcos hayashi on 26/04/21.
//  Copyright © 2021 marcos hayashi. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.getNumbersOflineCollectionView()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return self.viewModel.makeCollectionViewCell(collectionView: collectionView, indexPath: indexPath)
    }
    
}
