//
//  MusicScreen.swift
//  AppMusicBF
//
//  Created by Fernando Moreira on 09/01/23.
//

import UIKit

protocol MusicScreenDelegate: AnyObject {
    func tappedMusicView()
}

class MusicScreen: UIView {

    private weak var delegate: MusicScreenDelegate?
    
    lazy var view: UIView = {
       let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        v.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(actionMusicView)))
        return v
    }()
    
    lazy var musicWrapView: UIView = {
       let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var musicImageView: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "fifa_world_cup_qatar_intro")
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
        return img
    }()
    
    lazy var playImageView: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "play.fill")
        img.tintColor = .white
        return img
    }()
    
    lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Energia"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
        self.setupConstraints()
    }
    
    @objc func actionMusicView() {
        self.delegate?.tappedMusicView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        self.addSubview(self.view)
        self.view.addSubview(self.musicWrapView)
        self.view.addSubview(self.musicImageView)
        self.view.addSubview(self.playImageView)
        self.view.addSubview(self.titleLabel)
    }
    
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
        
            self.view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.view.topAnchor.constraint(equalTo: self.topAnchor),
            self.view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.musicWrapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            self.musicWrapView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10),
            self.musicWrapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            self.musicWrapView.heightAnchor.constraint(equalToConstant: 130),
            
            self.musicImageView.leadingAnchor.constraint(equalTo: self.musicWrapView.leadingAnchor),
            self.musicImageView.topAnchor.constraint(equalTo: self.musicWrapView.topAnchor),
            self.musicImageView.trailingAnchor.constraint(equalTo: self.musicWrapView.trailingAnchor),
            self.musicImageView.bottomAnchor.constraint(equalTo: self.musicWrapView.bottomAnchor),
            
            self.playImageView.centerYAnchor.constraint(equalTo: self.musicWrapView.centerYAnchor),
            self.playImageView.centerXAnchor.constraint(equalTo: self.musicWrapView.centerXAnchor),
            self.playImageView.heightAnchor.constraint(equalToConstant: 30),
            self.playImageView.widthAnchor.constraint(equalToConstant: 20),
            
            self.titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            self.titleLabel.topAnchor.constraint(equalTo: self.musicImageView.bottomAnchor, constant: 10),
            
        ])
    }
    
    public func configDelegates(delegate: MusicScreenDelegate){
        self.delegate = delegate
    }
    
}
