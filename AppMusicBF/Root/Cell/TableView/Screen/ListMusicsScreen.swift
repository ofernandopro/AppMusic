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
        label.font = UIFont.boldSystemFont(ofSize: 24)
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
            self.view.topAnchor.constraint(equalTo: self.topAnchor),
            self.view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.view.heightAnchor.constraint(equalToConstant: 150),
            
        ])
    }
    
    public func setupCell(title: String){
        self.titleLabel.text = title
    }
    
    public func configDelegates(delegate: ListMusicsScreenDelegate){
        self.delegate = delegate
    }

}
