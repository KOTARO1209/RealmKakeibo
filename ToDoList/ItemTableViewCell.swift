//
//  ItemTableViewCell.swift
//  RealmKakeibo
//
//  Created by まちだこうたろう on 2023/02/07.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var markImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(title: String, contents: String, isMarked: Bool, date: String) {
        titleLabel.text = title
        priceLabel.text = String(contents) //+ "円"
        dateLabel.text = String(date)
        if isMarked {
            markImageView.image = UIImage(systemName: "star.fill")
        } else {
            markImageView.image = UIImage(systemName: "star")
        }
    }
}
