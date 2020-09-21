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
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell") as! BannerTableViewCell
        cell.bannerData = allData?.banners
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.height * 0.3
    }
}

