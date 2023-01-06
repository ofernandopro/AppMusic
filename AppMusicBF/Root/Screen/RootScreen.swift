//
//  RootScreen.swift
//  AppMusicBF
//
//  Created by Fernando Moreira on 05/01/23.
//

import UIKit

class RootScreen: UIView {

    lazy var tableView: UITableView = {
       let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorStyle = .none
        tv.showsVerticalScrollIndicator = false
        return tv
    }()
    
    init() {
       super.init(frame: CGRect())
        DispatchQueue.main.async {
            self.setupViews()
            self.setupConstraints()
        }
   }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.addSubview(self.tableView)
    }
    
    private func setupConstraints(){
        
        self.tableView.pin(to: self)
        
    }
    
    public func configDelegates(tableViewDelegate: UITableViewDelegate, tableViewDataSource: UITableViewDataSource) {
        self.tableView.delegate = tableViewDelegate
        self.tableView.dataSource = tableViewDataSource
    }
    
}
