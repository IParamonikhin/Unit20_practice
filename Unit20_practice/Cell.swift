//
//  Cell.swift
//  Unit20_practice
//
//  Created by Иван on 14.05.2023.
//

import UIKit

class Cell: UICollectionViewCell {
    
    
    @IBOutlet weak var temperatureImage: UIImageView!
    @IBOutlet weak var smileImage: UIImageView!
    
    func setTemperatureImage(_ name: String){
        temperatureImage.image = UIImage(named: name)
    }
    
    func setSmileImage(_ name: String){
        smileImage.image = UIImage(named: name)
    }
}
