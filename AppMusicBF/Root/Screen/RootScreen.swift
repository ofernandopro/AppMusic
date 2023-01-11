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
        l.font = UIFont.boldSystemFont(ofSize: 26)
        l.text = "Music"
        return l
    }()
    
    lazy var profileButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("", for: .normal)
        btn.setImage(UIImage(systemName: "person.crop.circle.fill"), for: .normal)
        btn.tintColor = UIColor.systemPink
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        btn.addTarget(self, action: #selector(self.profilePressed), for: .touchUpInside)
        return btn
    }()
    
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.register(MusicTypeCollectionViewCell.self, forCellWithReuseIdentifier: MusicTypeCollectionViewCell.identifier)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 150, height: 50)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        cv.setCollectionViewLayout(layout, animated: false)
        return cv
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorStyle = .none
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
        tv.register(ListMusicsTableViewCell.self, forCellReuseIdentifier: ListMusicsTableViewCell.identifier)
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
        self.headerView.addSubview(self.collectionView)
        self.addSubview(self.tableView)
    }
    
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            
            self.headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 160),
            
            self.logoImageView.topAnchor.constraint(equalTo: self.headerView.topAnchor, constant: 30),
            self.logoImageView.leadingAnchor.constraint(equalTo: self.headerView.leadingAnchor, constant: 12),
            self.logoImageView.heightAnchor.constraint(equalToConstant: 30),
            self.logoImageView.widthAnchor.constraint(equalToConstant: 30),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.headerView.topAnchor, constant: 30),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.logoImageView.trailingAnchor, constant: 5),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.profileButton.leadingAnchor, constant: -20),
            
            self.profileButton.topAnchor.constraint(equalTo: self.headerView.topAnchor, constant: 30),
            self.profileButton.trailingAnchor.constraint(equalTo: self.headerView.trailingAnchor, constant: -10),
            self.profileButton.heightAnchor.constraint(equalToConstant: 30),
            self.profileButton.widthAnchor.constraint(equalToConstant: 30),
            
            self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.headerView.bottomAnchor, constant: -20),
            self.collectionView.heightAnchor.constraint(equalToConstant: 50),
            
            self.tableView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
        ])
        
    }
    
    public func configDelegates(rootScreenDelegate: RootScreenDelegate, collectionViewDelegate: UICollectionViewDelegate, collectionViewDataSource: UICollectionViewDataSource, tableViewDelegate: UITableViewDelegate, tableViewDataSource: UITableViewDataSource) {
        self.delegate = rootScreenDelegate
        self.collectionView.delegate = collectionViewDelegate
        self.collectionView.dataSource = collectionViewDataSource
        self.tableView.delegate = tableViewDelegate
        self.tableView.dataSource = tableViewDataSource
    }
    
    @objc func profilePressed() {
        print(#function)
        self.delegate?.tappedProfileButton()
    }
    
}
