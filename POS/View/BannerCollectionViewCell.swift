//
//  BannerCollectionViewCell.swift
//  POS
//
//  Created by Cinesoft on 21/09/20.
//

import UIKit
import Kingfisher
class BannerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    var imageUrl : String?{
        willSet{
            let urlString = newValue?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            let imageURL = URL(string: urlString ?? "")
            imageView.kf.setImage(with: imageURL)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
