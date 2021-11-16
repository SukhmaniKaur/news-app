//
//  NewsListVC.swift
//  NewApp
//
//  Created by MACBOOK on 15/11/21.
//

import UIKit

class NewsListVC: UIViewController {
    
    private var newsListVM: NewsListViewModel = NewsListViewModel()
    private var refreshControl : UIRefreshControl = UIRefreshControl.init()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    //MARK: - configUI
    private func configUI() {
        tableView.accessibilityIdentifier = STATIC_LABELS.tableView.rawValue
        tableView.register(UINib(nibName: TABLE_VIEW_CELL.NewsListCell.rawValue, bundle: nil), forCellReuseIdentifier: TABLE_VIEW_CELL.NewsListCell.rawValue)
        refreshControllSetup()
        newsListVM.fetchNewsList()
        
        newsListVM.success.bind { [weak self](_) in
            guard let `self` = self else { return }
            if self.newsListVM.success.value {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    //MARK: - Refresh controll setup
    private func refreshControllSetup() {
        refreshControl.tintColor = AppColors.LoaderColor
        refreshControl.addTarget(self, action: #selector(refreshDataSetUp) , for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    //MARK: - Refresh data
    @objc func refreshDataSetUp() {
        refreshControl.endRefreshing()
        newsListVM.fetchNewsList()
    }
}

//MARK: - UITableView DataSource and Delegate Methods
extension NewsListVC: UITableViewDelegate, UITableViewDataSource {
    
    //numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsListVM.listArr.value.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    // cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TABLE_VIEW_CELL.NewsListCell.rawValue, for: indexPath) as? NewsListCell else { return UITableViewCell() }
        cell.listInfo = newsListVM.listArr.value[indexPath.row]
        return cell
    }
    
    // didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = STORYBOARD.MAIN.instantiateViewController(withIdentifier: MAIN_STORYBOARD.NewsDetailVC.rawValue) as! NewsDetailVC
        vc.newsUrl = newsListVM.listArr.value[indexPath.row].url
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
