//
//  ListMusicsScreen.swift
//  AppMusicBF
//
//  Created by Fernando Moreira on 09/01/23.
//

import UIKit

protocol ListMusicsScreenDelegate: AnyObject{
    
}

class ListMusicsScreen: UIView {
    
    private weak var delegate: ListMusicsScreenDelegate?

    lazy var view: UIView = {
       let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        return v
    }()
    
    lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.register(MusicCollectionViewCell.self, forCellWithReuseIdentifier: MusicCollectionViewCell.identifier)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 150, height: 200)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        cv.setCollectionViewLayout(layout, animated: false)
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        self.addSubview(self.view)
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.collectionView)
    }
    
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
        
            self.view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.view.topAnchor.constraint(equalTo: self.topAnchor),
            self.view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.view.heightAnchor.constraint(equalToConstant: 250),
            
            self.titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10),
            
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.collectionView.heightAnchor.constraint(equalToConstant: 200)
            
        ])
    }
    
    public func setupCell(title: String){
        self.titleLabel.text = title
    }
    
    public func configDelegates(delegate: ListMusicsScreenDelegate, collectionViewDelegate: UICollectionViewDelegate, collectionViewDataSource: UICollectionViewDataSource){
        self.delegate = delegate
        self.collectionView.delegate = collectionViewDelegate
        self.collectionView.dataSource = collectionViewDataSource
    }

}
