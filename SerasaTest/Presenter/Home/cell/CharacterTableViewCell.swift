//
//  CharacterTableViewCell.swift
//  SerasaTest
//
//  Created by marcos hayashi on 26/04/21.
//  Copyright © 2021 marcos hayashi. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgCharacter: UIImageView!
    @IBOutlet weak var lbId: UILabel!
    @IBOutlet weak var lbName: UILabel!
    
    func prepare(character: Character?){
                
        self.lbName.text = character?.name
        self.lbId.text = "\(character?.id ?? 0)"
        
        let path = ImageRoute.portrait_medium(path: character?.thumbnail?.path ?? String(), format: character?.thumbnail?.format ?? String()).value
        let pathHTTPS = path.replacingOccurrences(of: "http", with: "https")
        let image = UIImage(named: "icon")!
        let imageUrl = URL(string: pathHTTPS)
        self.imgCharacter.kf.indicatorType = .activity
        self.imgCharacter.kf.setImage(with: imageUrl, placeholder: image)
    
                
    }

}
