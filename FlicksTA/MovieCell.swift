//
//  MovieCell.swift
//  FlicksTA
//
//  Created by Aristotle on 2017-11-17.
//  Copyright © 2017 HLPostman. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var overviewScrollView: UIScrollView!
    @IBOutlet weak var posterImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        overviewScrollView.contentSize = CGSize(width: 248, height: 98)
        overviewScrollView.contentSize.height = 150
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
