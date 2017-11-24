//
//  BrowseByPosterViewController.swift
//  FlicksTA
//
//  Created by Aristotle on 2017-11-24.
//  Copyright © 2017 HLPostman. All rights reserved.
//

import UIKit
import AlamofireImage

class BrowseByPosterViewController: UIViewController, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        print("Called viewDidLoad() from BrowseByPosterViewController")
        fetchMovies()
    
        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCollectionViewCell", for: indexPath) as! PosterCollectionViewCell
        let movie = movies[indexPath.item]
        if let posterPath = movie["poster_path"] as? String {
            let baseURL = "https://image.tmdb.org/t/p/w500"
            if let posterURL = URL(string: baseURL + posterPath) {
                cell.posterImageView.af_setImage(withURL: posterURL)
            }
        }
        return cell
    }
    
    func fetchMovies() {
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
                self.collectionView.reloadData()
//                print("Attempt to end refreshing")
//                self.refreshControl.endRefreshing()
//                print("Called endRefreshing")
            }
        }
        task.resume()
//        activityViewIndicator.stopAnimating()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MovieDetailsViewController
        let cell = sender as! UICollectionViewCell
        let indexPath = collectionView.indexPath(for: cell)
        print("CollectionView sending cell index path is \(String(describing: indexPath))")
        let movie = movies[(indexPath?.row)!]
        vc.movie = movie
        
    }

}
