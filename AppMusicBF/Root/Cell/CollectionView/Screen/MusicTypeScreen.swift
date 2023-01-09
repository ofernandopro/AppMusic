//
//  MusicTypeScreen.swift
//  AppMusicBF
//
//  Created by Fernando Moreira on 09/01/23.
//

import UIKit

class MusicTypeScreen: UIView {

    lazy var view: UIView = {
       let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        v.layer.cornerRadius = 20
        v.layer.borderWidth = 2
        v.layer.borderColor = UIColor.systemPink.cgColor
        return v
    }()
    
    lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Energia"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.numberOfLines = 1
        return label
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
    }
    
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
        
            self.view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.view.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            self.view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            self.view.heightAnchor.constraint(equalToConstant: 50),
            
            self.titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        
        ])
    }

}
