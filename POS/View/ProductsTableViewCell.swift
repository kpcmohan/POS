//
//  ProductsTableViewCell.swift
//  POS
//
//  Created by Cinesoft on 21/09/20.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {

    @IBOutlet weak var productsCollectionViewCell: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var products : [FreshProduct]?{
        didSet{
            productsCollectionViewCell.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCollectionViewCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func registerCollectionViewCell() {
        productsCollectionViewCell.delegate = self
        productsCollectionViewCell.dataSource = self
        productsCollectionViewCell.register(UINib(nibName: "ProductsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductsCollectionViewCell")
    }
    
}

extension ProductsTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCollectionViewCell", for: indexPath) as! ProductsCollectionViewCell
        let object = products?[indexPath.item]
        cell.product = object
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 210)
    }
}
