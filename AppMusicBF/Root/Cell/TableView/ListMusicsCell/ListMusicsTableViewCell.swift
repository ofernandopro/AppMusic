//
//  ListMusicsTableViewCell.swift
//  AppMusicBF
//
//  Created by Fernando Moreira on 09/01/23.
//

import UIKit

class ListMusicsTableViewCell: UITableViewCell {

    static let identifier: String = "ListMusicsTableViewCell"
    
    var screen: ListMusicsScreen = ListMusicsScreen()
    var listMusics: [Music] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.listMusics = MusicData
        self.screen.configDelegates(delegate: self, collectionViewDelegate: self, collectionViewDataSource: self)
        self.setupDesign()
        self.setupViews()
        self.setupConstraints()
    }
    
    private func setupDesign(){
        self.backgroundColor = .clear
    }
    
    public func setupCell(title: String){
        self.screen.titleLabel.text = title
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

extension ListMusicsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listMusics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MusicCollectionViewCell.identifier, for: indexPath) as? MusicCollectionViewCell
        cell?.setupDesign(data: self.listMusics[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //return CGSize.init(width: view.frame.width, height: 50)
        return CGSize.init(width: 150, height: 200)
    }
    
}

extension ListMusicsTableViewCell: ListMusicsScreenDelegate {

}
