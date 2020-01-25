//
//  ProfileViewController.swift
//  MovieSampleProject
//
//  Created by Xcode on 22.01.2020.
//  Copyright © 2020 Xcode. All rights reserved.
//

import UIKit
import Kingfisher
class ProfileViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate{
    var _profile = [Profile]()
    let _getProfile = GetProfile()
    @IBOutlet weak var StoryColl: UICollectionView!
    @IBOutlet weak var PostColl: UICollectionView!
    @IBOutlet weak var ImagePostColl: UICollectionView!    
    @IBAction func CameraButton(_ sender: Any) {
    }
    @IBAction func PostLikeButton(_ sender: Any) {
    }
    @IBAction func PostCommentButton(_ sender: Any) {
    }
    @IBAction func PostShareButton(_ sender: Any) {
    }
    @IBAction func PostMoreButton(_ sender: Any) {
    }
    @IBAction func ImagePostLikeButton(_ sender: Any) {
    }
    @IBAction func ImagePostCommentButton(_ sender: Any) {
    }
    @IBAction func ImagePostShareButton(_ sender: Any) {
    }
    @IBAction func ImagePostMoreButton(_ sender: Any) {
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == StoryColl  {
            return _profile.count
        }  else if collectionView == PostColl {
            return _profile.count
        } else {
            return _profile.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == StoryColl  {
            guard let cellStory = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath) as?
                StoryCollectionViewCell else { return UICollectionViewCell() }
            cellStory.StoryName.text = _profile[indexPath.row].userFullName!.split{$0 == " "}.map(String.init)[0]
            cellStory.StoryImage.layer.borderWidth = 2
            cellStory.StoryImage.layer.borderColor = UIColor(red:80/255, green:155/255, blue:243/255, alpha: 1).cgColor
            let imageURL = URL(string: _profile[indexPath.row].userImageUrl!)
            cellStory.StoryImage.kf.setImage(with: imageURL)
            return cellStory
        } else if collectionView == PostColl {
            guard let cellPost = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as?
                PostCollectionViewCell else { return UICollectionViewCell() }
            cellPost.PostName.text = _profile[indexPath.row].userFullName
            cellPost.PostCreate.text = _profile[indexPath.row].createdAt
            cellPost.PostMessage.text = _profile[indexPath.row].postMessage
            cellPost.PostLikeCount.text = "\(_profile[indexPath.row].likeCount ?? 0)"
            cellPost.PostCommentCount.text = "\(_profile[indexPath.row].commentCount ?? 0)"
            let imageURL = URL(string: _profile[indexPath.row].userImageUrl!)
            cellPost.PostUserImage.kf.setImage(with: imageURL)
            return cellPost
        } else {
            guard let cellImagePost = collectionView.dequeueReusableCell(withReuseIdentifier: "ImagePostCell", for: indexPath) as?
                ImagePostCollectionViewCell else { return UICollectionViewCell() }
            cellImagePost.ImagePostName.text = _profile[indexPath.row].userFullName
            cellImagePost.ImagePostCreate.text = _profile[indexPath.row].createdAt
            cellImagePost.ImagePostMessage.text = _profile[indexPath.row].postMessage
            cellImagePost.ImagePostLikeCount.text = "\(_profile[indexPath.row].likeCount ?? 0)"
            cellImagePost.ImagePostCommentCount.text = "\(_profile[indexPath.row].commentCount ?? 0)"
            let imageURL = URL(string: _profile[indexPath.row].userImageUrl!)
            cellImagePost.ImagePostUserImage.kf.setImage(with: imageURL)
            let imageURL1 = URL(string: _profile[indexPath.row].postImage!)
            cellImagePost.ImagePostImage.kf.setImage(with: imageURL1)
            return cellImagePost
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
            _getProfile.getProfileData { (Profile) in
            self._profile = Profile
            self.StoryColl.reloadData()
            self.PostColl.reloadData()
            self.ImagePostColl.reloadData()
        }
        StoryColl.dataSource = self
        StoryColl.delegate = self
        PostColl.dataSource = self
        PostColl.delegate = self
        ImagePostColl.dataSource = self
        ImagePostColl.delegate = self
    }
}
