//
//  CategoriesCollectionViewCell.swift
//  POS
//
//  Created by Cinesoft on 21/09/20.
//

import UIKit
import Kingfisher
class CategoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    var imageUrl : String?{
        willSet{
            let urlString = newValue?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            let imageURL = URL(string: urlString ?? "")
            imageView.kf.setImage(with: imageURL)
        }
    }
    var categoryTitle : String?{
        willSet{
            categoryTitleLabel.text = newValue
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        configureCell()
    }
    func configureCell() {
        imageView.layer.cornerRadius = imageView.frame.size.width / 2.0
        bgImageView.layer.cornerRadius = bgImageView.frame.size.width / 2.0
        self.contentView.layer.cornerRadius = 2.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        
    }

}
