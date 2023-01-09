//
//  MusicTypeCollectionViewCell.swift
//  AppMusicBF
//
//  Created by Fernando Moreira on 08/01/23.
//

import UIKit

class MusicTypeCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "MusicTypeCollectionViewCell"
    
    var screen: MusicTypeScreen = MusicTypeScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.setupViews()
        self.setupConstraints()
    }
    
    public func setupDesign(data: String){
        self.screen.titleLabel.text = data
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
