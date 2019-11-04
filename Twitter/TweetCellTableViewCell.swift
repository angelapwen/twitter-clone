//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Angela Wen on 11/2/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContentLabel: UILabel!
    
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    
    var favorited: Bool = false
    var tweetId: Int = -1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setFavorited(_ isFavorited: Bool) {
        favorited = isFavorited
        
        if favorited {
            favButton.setImage(UIImage.init(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else {
            favButton.setImage(UIImage.init(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        
        if toBeFavorited {
            TwitterAPICaller.client?.favoriteTweet(tweetId: self.tweetId, success: {
                self.setFavorited(true)
            }, failure: { (error) in
                print("Favorite action did not succeed: \(error)")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: self.tweetId, success: {
                self.setFavorited(false)
            }, failure: { (error) in
                print("Unfavorite action did not succeed: \(error)")
            })
        }
    }
    
    @IBAction func retweet(_ sender: Any) {
    }
    
    

}
