//
//  ViewController.swift
//  RedditPostViewer
//
//  Created by Akhil Pothana on 9/12/19.
//  Copyright © 2019 Akhil. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var redditTableView: UITableView!
    

    var postDictionary = ["Title 1", "computers", "apple", "Title 4", "iPhone"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redditTableView.delegate = self
        redditTableView.dataSource = self
        registerNibs()
    }
    
    private func setup() {
        
    }
    
    // MARK: - Regiser Nibs
    func registerNibs() {
        let redditPostNib = UINib(nibName: String(describing: RedditPostTableViewCell.self), bundle: nil)
        self.redditTableView.register(redditPostNib, forCellReuseIdentifier: String(describing: RedditPostTableViewCell.self))
    }
    
    // MARK: - UITableViewDelegate and UITableViewDataSource methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let redditPostCell = tableView.dequeueReusableCell(withIdentifier: String(describing: RedditPostTableViewCell.self), for: indexPath) as? RedditPostTableViewCell else { return UITableViewCell() }
        redditPostCell.postTitleLabel.text = postDictionary[indexPath.row]
        
        return redditPostCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

