//
//  NowPlayingViewController.swift
//  FlicksTA
//
//  Created by Aristotle on 2017-11-16.
//  Copyright © 2017 HLPostman. All rights reserved.
//

import UIKit

class NowPlayingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    var movies: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Tableview setup
        tableView.dataSource = self
        tableView.delegate = self
        
        // Network request
        let task = makeNetworkRequest()
        task.resume()
      
    }

    func makeNetworkRequest() -> URLSessionTask {
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        // cachePolicy set to .reloardIgnoringLocalCacheData for testing
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print("Error from NowPlayingViewController network request with localized description \"\(error.localizedDescription)\"")
            } else if let data = data {
                // try! should be a do-catch loop in refactoring for safety
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let movies = dataDictionary["results"] as! [[String: Any]]
                self.movies = movies
                self.tableView.reloadData()
            }
        }
        return task
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Number of movies is \(movies.count)")
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Debug
        print("Called cellForRowAt")
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let overview = movie["overview"] as! String
        
        cell.titleLabel.text = title
        // Debug - title successfully accessed but not rendered in cell
        print(title)
        cell.overviewLabel.text = overview

        return cell
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}