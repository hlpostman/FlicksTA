//
//  MenuViewController.swift
//  FlicksTA
//
//  Created by Aristotle on 2017-11-19.
//  Copyright © 2017 HLPostman. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var nowPlayingCollectionView: UICollectionView!
   
    @IBOutlet weak var topRatedCollectionView: UICollectionView!
    
    @IBOutlet weak var familyCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nowPlayingCollectionView.dataSource = self
        topRatedCollectionView.dataSource = self
        familyCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // This will be .count of list of actors in sender's associated dictinary
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath)
        // Debug
        if (collectionView == nowPlayingCollectionView) {
            cell.backgroundColor = .green
//            return cell
        } else if (collectionView == topRatedCollectionView) {
            cell.backgroundColor = .blue
//            return cell
        } else if (collectionView == familyCollectionView) {
            cell.backgroundColor = .red
        }
    
        // Debug
//        cell.backgroundColor = .green
        return cell
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
