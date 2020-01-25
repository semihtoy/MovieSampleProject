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
    var _movieForYou = [Movie]()
    var _moviePopular = [Movie]()
    let _getMovie = GetMovie()
    @IBOutlet weak var PopularColl: UICollectionView!
    @IBOutlet weak var ForYouColl: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == ForYouColl  {
            return _movieForYou.count
        } else {
            return _moviePopular.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == ForYouColl  {
            guard let cellFor = collectionView.dequeueReusableCell(withReuseIdentifier: "ForYouCell", for: indexPath) as?
                ForYouCollectionViewCell else { return UICollectionViewCell() }
            cellFor.ForYouTitle.text = _movieForYou[indexPath.row].movieTitle
            cellFor.ForYouGenre.text = "\(_movieForYou[indexPath.row].movieGenre ?? "Bos")  "
            cellFor.ForYouYear.text = "\(_movieForYou[indexPath.row].movieYear ?? 0)"
            let imageURL = URL(string: _movieForYou[indexPath.row].movieImage!)
            cellFor.ForYouImage.kf.setImage(with: imageURL)
            return cellFor
        } else {
            guard let cellPop = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCell", for: indexPath) as?
                PopularCollectionViewCell else { return UICollectionViewCell() }
            cellPop.PopularTitle.text = _moviePopular[indexPath.row].movieTitle
            cellPop.PopularYear.text = "\(_moviePopular[indexPath.row].movieYear ?? 0)"
            let imageURL = URL(string: _moviePopular[indexPath.row].movieImage!)
            cellPop.PopularImage.kf.setImage(with: imageURL)
            return cellPop
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            _getMovie.getMovieData{ (Movie) in
            self._movieForYou = Movie.filter{ $0.isRecommended==true }
            self._moviePopular = Movie.filter{ $0.isRecommended==false }
            self.ForYouColl.reloadData()
            self.PopularColl.reloadData()
        }
        ForYouColl.dataSource = self
        ForYouColl.delegate = self
        PopularColl.dataSource = self
        PopularColl.delegate = self
    }
}

