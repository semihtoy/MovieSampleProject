//
//  MovieViewController.swift
//  MovieSampleProject
//
//  Created by Xcode on 22.01.2020.
//  Copyright © 2020 Xcode. All rights reserved.
//

import UIKit
import Kingfisher
class MovieViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    var http = HTTP()
    var _movie = [Movie]()
    let _movieSearch = MovieSearch()
    @IBOutlet weak var PopularColl: UICollectionView!
    @IBOutlet weak var ForYouColl: UICollectionView!

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _movie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cellFor = collectionView.dequeueReusableCell(withReuseIdentifier: "ForYouCell", for: indexPath) as?
            ForYouCollectionViewCell else { return UICollectionViewCell() }
        guard let cellPop = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCell", for: indexPath) as?
              PopularCollectionViewCell else { return UICollectionViewCell() }
        if _movie[indexPath.row].isRecommended != false {
  
        cellFor.ForYouTitle.text = _movie[indexPath.row].movieTitle
        cellFor.ForYouGenre.text = _movie[indexPath.row].movieGenre
        cellFor.ForYouYear.text = "\(_movie[indexPath.row].movieYear)"
        let imageURL = URL(string: _movie[indexPath.row].movieImage!)
        cellFor.ForYouImage.kf.setImage(with: imageURL)
        return cellFor
        } else {
            cellPop.PopularTitle.text = _movie[indexPath.row].movieTitle
             cellPop.PopularYear.text = "\(_movie[indexPath.row].movieYear)"
            let imageURL = URL(string: _movie[indexPath.row].movieImage!)
            cellPop.PopularImage.kf.setImage(with: imageURL)
            return cellPop
        }
        
    }
        
    
    override func viewDidLoad() {
        _movieSearch.search { (Movie) in
            self._movie = Movie
            self.ForYouColl.reloadData()
            self.PopularColl.reloadData()
        }
        ForYouColl.dataSource = self
        ForYouColl.delegate = self
        ForYouColl.reloadData()
        PopularColl.dataSource = self
        PopularColl.delegate = self
        PopularColl.reloadData()
        super.viewDidLoad()
    }
}

