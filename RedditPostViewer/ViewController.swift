import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let urlString = "https://www.reddit.com/.json"
    
    @IBOutlet var redditTableView: UITableView!
    

    var postDictionary = ["Title 1", "computers", "apple", "Title 4", "iPhone"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.downlaodJsonWithURL()
        
        
        redditTableView.delegate = self
        redditTableView.dataSource = self
        registerNibs()
        
        navigationController?.navigationBar.prefersLargeTitles = true 
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
    
    func downlaodJsonWithURL() {
        let url = NSURL(string: urlString)
        URLSession.shared.dataTask(with: (url as? URL)!, completionHandler: {(data, response, error) -> Void in
            
        }).resume()
    }
    
    func downloadJsonWithTask(){
        
        let url = NSURL(string: urlString)
        
        var downloadTask = URLRequest(url: (url as? URL)!, cachePolicy: URLRequest.CachePolicy. reloadIgnoringCacheData, timeoutInterval: 20)
        
        var downloadRequest = URLRequest(url: as? URL)!)
        
        downloadTask.httpMethod = "GET"
        
        
        
        
    }
    
    
    
    
    
    
    
    
}

