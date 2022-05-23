//
//  DetailViewController.swift
//  anime
//
//  Created by 박호현 on 2022/05/23.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {
    @IBOutlet var detailImageView: UIImageView!
    @IBOutlet var detailTitle: UILabel!
    @IBOutlet var detaildiscription: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    var model: AnimeData?
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        detailTitle.text = model?.attributes.canonicalTitle
        detaildiscription.text = model?.attributes.synopsis
        if let url = model?.attributes.coverImage?.large, let imagerUrl = URL(string: url) {
            Nuke.loadImage(with: imagerUrl, into: detailImageView)
        }
    }
}
