//
//  NewsListVC.swift
//  NewApp
//
//  Created by MACBOOK on 15/11/21.
//

import UIKit

class NewsListVC: UIViewController {
    
    private var newsListVM: NewsListViewModel = NewsListViewModel()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    //MARK: - configUI
    private func configUI() {
        tableView.register(UINib(nibName: TABLE_VIEW_CELL.NewsListCell.rawValue, bundle: nil), forCellReuseIdentifier: TABLE_VIEW_CELL.NewsListCell.rawValue)
        
        newsListVM.fetchNewsList()
    }

}

//MARK: - UITableView DataSource and Delegate Methods
extension NewsListVC: UITableViewDelegate, UITableViewDataSource {
    
    //numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    // cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TABLE_VIEW_CELL.NewsListCell.rawValue, for: indexPath) as? NewsListCell else { return UITableViewCell() }
        return cell
    }
}
