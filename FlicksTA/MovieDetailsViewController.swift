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
    var cast: [[String: Any]]?
    var castSize: Int = Int()
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
        let placeholderImage = UIImage(named: "Poster ph x3")
        let baseURL = "https://image.tmdb.org/t/p/w500"
        if let posterPath = movie["poster_path"] as? String {
            if let posterURL = URL(string: baseURL + posterPath) {
                posterImageView.af_setImage(withURL: posterURL, placeholderImage: placeholderImage)
            } else {
                posterImageView.image = nil
            }
        }
        
        // Cast collection view
        castCollectionView.dataSource = self
        let movieId = movie["id"] as! Int
        print("\(movieTitle) - Movie ID is \(movieId)")
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
        print("fetchCast() about to set task")
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
                self.castSize = cast.count
                print("castSize set to \(self.castSize)")
                self.castCollectionView.reloadData()
            }
            
        }
        task.resume()
        
    }
    
    func getCastWithPhotosOnly(_ cast: [[String: Any]]) -> [[String: Any]] {
        // Debug
        print("Called getCastWithPhotosOnly")
        var castWithPhotos: [[String: Any]] = [[:]]
        for castMember in cast {
        if castMember["profile_path"] != nil {
                castWithPhotos.append(castMember)
            }
        }
        print(castWithPhotos.count)
        return castWithPhotos

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension MovieDetailsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // This will be .count of list of actors in sender's associated dictinary
        // Debug
        print("NumberOfItemsInSection sees cast.count as \(String(describing: cast?.count)) and castSize as \(castSize), and is returning castSize")
        return castSize
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CastCollectionViewCell", for: indexPath) as! CastCollectionViewCell
        cell.castMemberNameLabel.text = String(describing: indexPath.row)
        if let castMember = cast?[indexPath.row] {
            let castMemberName = castMember["name"] as? String ?? "Error fetching name"
            cell.castMemberNameLabel.text = castMemberName
            let baseURL = "https://image.tmdb.org/t/p/w500"
            if let headShotPath = castMember["profile_path"] as? String {
                if let headShotURL = URL(string: baseURL + headShotPath) {
                    cell.castMemberPhotoImageView.af_setImage(withURL: headShotURL)
                } else {
                    cell.castMemberPhotoImageView.image = nil
                }
                
            }

        }

        return cell
    }
    
}
