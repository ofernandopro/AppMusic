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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.setupDesign()
        self.setupViews()
        self.setupConstraints()
    }
    
    private func setupDesign(){
        self.backgroundColor = .clear
    }
    
    private func setupViews(){
        self.contentView.addSubview(self.screen)
    }
    
    private func setupConstraints(){
        self.screen.pin(to: self.contentView)
    }
    
    public func setupCell(title: String){
        self.screen.setupCell(title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
