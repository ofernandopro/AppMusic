//
//  MusicDetailsViewController.swift
//  AppMusicBF
//
//  Created by Fernando Moreira on 09/01/23.
//

import UIKit

class MusicDetailsViewController: UIViewController {

    var screen: MusicDetailsScreen?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func loadView() {
        self.screen = MusicDetailsScreen()
        self.screen?.configDelegates(delegate: self)
        self.view = self.screen
    }

}

extension MusicDetailsViewController: MusicDetailsScreenDelegate {
    
    func tappedCloseButton() {
        print(#function)
        self.dismiss(animated: true, completion: nil)
    }
    
}
