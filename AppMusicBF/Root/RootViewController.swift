//
//  RootViewController.swift
//  AppMusicBF
//
//  Created by Fernando Moreira on 05/01/23.
//

import UIKit

class RootViewController: UIViewController {
    
    var screen: RootScreen?
    
    let listOptionsMusicTypes = ["Relax", "Em trânsito", "Energia", "Treino", "Foco"]
    //var listSections = ["Para Você", "Mais Tocadas", "Minhas Preferidas", "Pagode", "Internacional"]
    var listSections = ["Para Você"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func loadView() {
        self.screen = RootScreen()
        self.screen?.configDelegates(rootScreenDelegate: self, collectionViewDelegate: self, collectionViewDataSource: self, tableViewDelegate: self, tableViewDataSource: self)
        self.view = self.screen
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
}

extension RootViewController: RootScreenDelegate {
    
    func tappedProfileButton() {
        print(#function)
    }
    
}

extension RootViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listSections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListMusicsTableViewCell.identifier, for: indexPath) as? ListMusicsTableViewCell
        cell?.setupCell(title: self.listSections[indexPath.row])
        cell?.configDelegate(delegate: self)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
}

extension RootViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listOptionsMusicTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MusicTypeCollectionViewCell.identifier, for: indexPath) as? MusicTypeCollectionViewCell
        cell?.setupDesign(data: self.listOptionsMusicTypes[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //return CGSize.init(width: view.frame.width, height: 50)
        return CGSize.init(width: 150, height: 50)
    }
    
}

extension RootViewController: ListMusicsTableViewCellDelegate {
    
    func tappedMusicViewCell() {
        print("tappedMusicViewCell")
        let vc = MusicDetailsViewController()
//        vc.modalPresentationStyle = .overFullScreen
//        self.navigationController?.pushViewController(vc, animated: true)
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
        
    }

}
