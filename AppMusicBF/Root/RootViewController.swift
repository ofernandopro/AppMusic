//
//  RootViewController.swift
//  AppMusicBF
//
//  Created by Fernando Moreira on 05/01/23.
//

import UIKit

class RootViewController: UIViewController {
    
    var screen: RootScreen?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
    }
    
    override func loadView() {
        self.screen = RootScreen()
        self.screen?.configDelegates(tableViewDelegate: self, tableViewDataSource: self)
        self.view = self.screen
    }
    
}

extension RootViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
