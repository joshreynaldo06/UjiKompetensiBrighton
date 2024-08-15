//
//  ListFilmTableViewCell.swift
//  ListMovie
//
//  Created by Josh JR Reynaldo on 15/08/24.
//

import UIKit

class ListFilmTableViewCell: UITableViewCell {

    @IBOutlet weak var filmTitleLabel: UILabel!
    @IBOutlet weak var filmYearLabel: UILabel!
    @IBOutlet weak var filmImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCellAppearances(
        filmImagePath: String,
        filmTitle: String,
        filmYear: String
    ) {
        self.filmImageView.loadImage(from: filmImagePath)
        self.filmTitleLabel.text = filmTitle
        self.filmYearLabel.text = filmYear
    }
    
}
