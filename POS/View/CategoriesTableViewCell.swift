//
//  CategoriesTableViewCell.swift
//  POS
//
//  Created by Cinesoft on 21/09/20.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var tableTitle: UILabel!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    var categories : [Category]?{
        willSet{
            tableTitle.text = "Categories"
            categoriesCollectionView.reloadData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        registerCollectionViewCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func registerCollectionViewCell() {
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
    }
}

extension CategoriesTableViewCell : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
        let object = categories?[indexPath.item]
        cell.imageUrl = object?.image
        cell.categoryTitle = object?.name
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 180)
    }
}
