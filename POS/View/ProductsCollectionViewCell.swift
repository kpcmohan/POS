//
//  ProductsCollectionViewCell.swift
//  POS
//
//  Created by Cinesoft on 21/09/20.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var product : FreshProduct?{
        willSet{
            let urlString = newValue?.image?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            let imageURL = URL(string: urlString ?? "")
            productImageView.kf.setImage(with: imageURL)
            
            productNameLabel.text = newValue?.name
            priceLabel.text = "₹\(newValue?.price ?? "0")"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
