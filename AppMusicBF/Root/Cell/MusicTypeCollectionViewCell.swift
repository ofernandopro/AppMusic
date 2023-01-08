//
//  MusicTypeCollectionViewCell.swift
//  AppMusicBF
//
//  Created by Fernando Moreira on 08/01/23.
//

import UIKit

class MusicTypeCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "MusicTypeCollectionViewCell"
    
    lazy var view: UIView = {
       let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .red
        return v
    }()
    
    lazy var title: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Teste"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 1
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.view)
        self.view.addSubview(self.title)
        self.setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.view.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            self.view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            self.view.heightAnchor.constraint(equalToConstant: 50),
            
            self.title.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            self.title.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 10),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
