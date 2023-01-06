//
//  RootScreen.swift
//  AppMusicBF
//
//  Created by Fernando Moreira on 05/01/23.
//

import UIKit

protocol RootScreenDelegate: AnyObject{
    func tappedProfileButton()
}

class RootScreen: UIView {
    
    private weak var delegate: RootScreenDelegate?

    lazy var headerView: UIView = {
       let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
        return v
    }()
    
    lazy var logoImageView: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "app_logo")
        return img
    }()
    
    lazy var titleLabel: UILabel = {
       let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .white
        l.font = UIFont.boldSystemFont(ofSize: 30)
        l.text = "Music"
        return l
    }()
    
    lazy var profileButton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("", for: .normal)
        btn.setImage(UIImage(systemName: "person.crop.circle.fill"), for: .normal)
        btn.tintColor = UIColor.white
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        btn.addTarget(self, action: #selector(self.profilePressed), for: .touchUpInside)
        return btn
    }()
    
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
        self.addSubview(self.headerView)
        self.headerView.addSubview(self.logoImageView)
        self.headerView.addSubview(self.titleLabel)
        self.headerView.addSubview(self.profileButton)
        self.addSubview(self.tableView)
    }
    
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
        
            self.headerView.topAnchor.constraint(equalTo: self.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 200),
            
            self.logoImageView.topAnchor.constraint(equalTo: self.headerView.topAnchor, constant: 70),
            self.logoImageView.leadingAnchor.constraint(equalTo: self.headerView.leadingAnchor, constant: 12),
            self.logoImageView.heightAnchor.constraint(equalToConstant: 40),
            self.logoImageView.widthAnchor.constraint(equalToConstant: 40),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.headerView.topAnchor, constant: 70),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.logoImageView.trailingAnchor, constant: 5),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.profileButton.leadingAnchor, constant: 20),
            
            self.profileButton.topAnchor.constraint(equalTo: self.headerView.topAnchor, constant: 70),
            self.profileButton.trailingAnchor.constraint(equalTo: self.headerView.trailingAnchor, constant: -20),
            self.profileButton.heightAnchor.constraint(equalToConstant: 50),
            self.profileButton.widthAnchor.constraint(equalToConstant: 50),
            
            self.tableView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
        ])
                
    }
    
    public func configDelegates(rootScreenDelegate: RootScreenDelegate, tableViewDelegate: UITableViewDelegate, tableViewDataSource: UITableViewDataSource) {
        self.delegate = rootScreenDelegate
        self.tableView.delegate = tableViewDelegate
        self.tableView.dataSource = tableViewDataSource
    }
    
    @objc func profilePressed() {
        print(#function)
        self.delegate?.tappedProfileButton()
    }
    
}
