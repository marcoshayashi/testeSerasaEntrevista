//
//  CharacterCollectionViewCell.swift
//  SerasaTest
//
//  Created by marcos hayashi on 25/04/21.
//  Copyright © 2021 marcos hayashi. All rights reserved.
//

import Foundation
import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgCharacter: UIImageView!
    @IBOutlet weak var lbCharacter: UILabel!
    
    func prepare(character: Character?){
            
        self.lbCharacter.text = character?.name 
        let path = ImageRoute.portrait_medium(path: character?.thumbnail?.path ?? String(), format: character?.thumbnail?.format ?? String()).value
        let pathHTTPS = path.replacingOccurrences(of: "http", with: "https")
        let image = UIImage(named: "icon")!
        let imageUrl = URL(string: pathHTTPS)
        self.imgCharacter.kf.indicatorType = .activity
        self.imgCharacter.kf.setImage(with: imageUrl, placeholder: image)
            
        }
}
