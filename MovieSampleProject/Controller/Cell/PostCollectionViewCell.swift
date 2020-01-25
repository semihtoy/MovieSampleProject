//
//  PostCollectionViewCell.swift
//  MovieSampleProject
//
//  Created by Xcode on 24.01.2020.
//  Copyright © 2020 Xcode. All rights reserved.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var PostUserImage: UIImageView!
    @IBOutlet weak var PostName: UILabel!
    @IBOutlet weak var PostCreate: UILabel!
    @IBOutlet weak var PostMessage: UILabel!
    @IBOutlet weak var PostLikeCount: UILabel!
    @IBOutlet weak var PostCommentCount: UILabel!    
}
