//
//  NowPlayingViewController.swift
//  FlicksTA
//
//  Created by Aristotle on 2017-11-16.
//  Copyright © 2017 HLPostman. All rights reserved.
//

import UIKit

class NowPlayingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                // print("🌸", dataDictionary)
                let movies = dataDictionary["results"] as! [[String: Any]]
                print("Getting titles...")
                for movie in movies {
                    let title = movie["title"] as! String
                    print(title)
                }
            }
        }
        task.resume()
      
    }

    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
