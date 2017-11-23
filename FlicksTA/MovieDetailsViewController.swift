//
//  MovieDetailsViewController.swift
//  FlicksTA
//
//  Created by Aristotle on 2017-11-19.
//  Copyright © 2017 HLPostman. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    var movie: [String: Any] = [:]
    var cast: [[String: Any]] = [[:]]
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var castCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Title and Overview
        let movieTitle = (movie["title"] as! String)
        self.title = movieTitle
        titleLabel.text = movieTitle
        overviewLabel.text = (movie["overview"] as! String)
        
        // Poster Image
        let baseURL = "https://image.tmdb.org/t/p/w500"
        if let posterPath = movie["poster_path"] as? String {
            if let posterURL = URL(string: baseURL + posterPath) {
             posterImageView.af_setImage(withURL: posterURL)
            }
        }
        
        // Cast collection view
        castCollectionView.dataSource = self
        let movieId = movie["id"] as! Int
        fetchCast(movieId)
        
    }

    func fetchCast(_ movieId: Int) {
        // Debug
        print("Called fetchCast")
        let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
        let creditsPath = "https://api.themoviedb.org/3/movie/\(movieId)/credits?api_key=\(apiKey)"
        let url = URL(string: creditsPath)!
        let request = URLRequest(url: url)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        print("about to set task")
        let task = session.dataTask(with: request)  { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print("Error from MoviesDetailViewController fetchCredits network request with localized description \"\(error.localizedDescription)\"")
            } else if let data = data {
                print("Got data")
                // try! should be a do-catch loop in refactoring for safety
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let cast = dataDictionary["cast"] as! [[String: Any]]
                self.cast = cast
                print("Got cast")
            }
            
        }
        task.resume()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MovieDetailsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // This will be .count of list of actors in sender's associated dictinary
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CastCollectionViewCell", for: indexPath)
        // Debug
        cell.backgroundColor = .green
        return cell
    }
    
}
