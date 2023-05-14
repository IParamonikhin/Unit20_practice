//
//  ViewController.swift
//  Unit20_practice
//
//  Created by Иван on 14.05.2023.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var arrayTemperature = ["temp.green", "temp.blackGreen", "temp.lightYellow", "temp.darkYellow", "temp.orange", "temp.red"]
    var arraySmile = ["favorite", "nice", "routine", "notPleasant", "bad", "hate"]


    @IBOutlet weak var collectionViewTop: UICollectionView!
    @IBOutlet weak var collectionViewBottom: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewTop.delegate = self
        collectionViewTop.dataSource = self
        
        collectionViewBottom.delegate = self
        collectionViewBottom.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(identifier: "ShowImageVC") as? ShowImageVC else { return }
        var currentSelectedImage: String!
        
        if collectionView == collectionViewTop{
            currentSelectedImage = arrayTemperature[indexPath.row]
            
        }
        if collectionView == collectionViewBottom{
            currentSelectedImage = arraySmile[indexPath.row]
            
        }
        vc.setImageName(currentSelectedImage)
        present(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewTop {
            return arrayTemperature.count
        }
        if collectionView == collectionViewBottom {
            return arraySmile.count
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewTop{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellOne", for: indexPath) as? Cell{
                let imageName = arrayTemperature[indexPath.row]
                cell.setTemperatureImage(imageName)
                return cell
            }
        }
        if collectionView == collectionViewBottom{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTwo", for: indexPath) as? Cell{
                let imageName = arraySmile[indexPath.row]
                cell.setSmileImage(imageName)
                return cell
            }
        }
        return UICollectionViewCell()
    }

}

