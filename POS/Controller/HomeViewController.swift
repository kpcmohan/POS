//
//  ViewController.swift
//  POS
//
//  Created by Cinesoft on 20/09/20.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var homeTableView: UITableView!
    
    var allData : AllData?{
        didSet{
            homeTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubView()
        registerTableViewCells()
        fetchHomeData()
    }
    func registerTableViewCells() {
        homeTableView.register(UINib(nibName: "BannerTableViewCell", bundle: nil), forCellReuseIdentifier: "BannerTableViewCell")
        homeTableView.register(UINib(nibName: "CategoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoriesTableViewCell")
        homeTableView.register(UINib(nibName: "ProductsTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductsTableViewCell")
        
    }
    func configureSubView() {
        homeTableView.tableFooterView = UIView()
        subView.clipsToBounds = true
        subView.layer.cornerRadius = 10
        subView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    func fetchHomeData() {
        APIClient.fetchHomeData { (result) in
            switch result{
            case .success(let data):
                self.allData = data.data
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }

}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return [allData?.banners,allData?.categories,allData?.fresh_products,allData?.ProductsForYou].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell") as! BannerTableViewCell
            cell.bannerData = allData?.banners
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesTableViewCell") as! CategoriesTableViewCell
            cell.categories = allData?.categories
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell") as! ProductsTableViewCell
            cell.products = allData?.fresh_products
            cell.titleLabel.text = "Fresh Items"
            return cell
        default:
            guard (allData?.ProductsForYou?.count ?? 0) > 0 else {
                return UITableViewCell()
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell") as! ProductsTableViewCell
            cell.products = allData?.ProductsForYou
            cell.titleLabel.text = "Items for you"
            return cell
        
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row{
        case 0:
            return self.view.frame.size.height * 0.35
        case 1:
            return 240
        case 2:
            return 480
        default:
            return 140
        }
    }
}

