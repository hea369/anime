//
//  AnimeTreadingTableViewCell.swift
//  anime
//
//  Created by 박호현 on 2022/05/13.
//

import UIKit

class AnimeTreadingTableViewCell: UITableViewCell {
    @IBOutlet var animePosterimageView: UIImageView!
    @IBOutlet var animeTitleLabel: UILabel!
    @IBOutlet var animeSynobsisLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        animePosterimageView.layer.cornerRadius = 15
        animePosterimageView.layer.borderColor = UIColor.red.cgColor
        animePosterimageView.layer.borderWidth = 1
    }
}
