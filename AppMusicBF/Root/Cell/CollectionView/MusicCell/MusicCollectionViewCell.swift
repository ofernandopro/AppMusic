//
//  MusicCollectionViewCell.swift
//  AppMusicBF
//
//  Created by Fernando Moreira on 09/01/23.
//

import UIKit

class MusicCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "MusicCollectionViewCell"
    
    var screen: MusicScreen = MusicScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.setupViews()
        self.setupConstraints()
    }
    
    public func setupDesign(data: Music){
        self.screen.titleLabel.text = data.name
        self.screen.musicImageView.image = UIImage(named: data.imageName ?? "")
    }
    
    private func setupViews(){
        self.contentView.addSubview(self.screen)
    }
    
    private func setupConstraints(){
        self.screen.pin(to: self.contentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
