//
//  MainViewController.swift
//  anime
//
//  Created by 박호현 on 2022/05/13.
//

import UIKit
import Nuke
import Alamofire

struct AnimePosterImage: Codable {
    let tiny: String
    let large: String
    let small: String
    let medium: String
    let original: String
}

struct AnimeAttributes: Codable {
    let synopsis: String
    let canonicalTitle: String
    let posterImage: AnimePosterImage
}

struct AnimeData: Codable {
    let id: String
    let type: String
    let attributes: AnimeAttributes
}

struct AnimeModel: Codable {
    let data: [AnimeData]
}

class MainViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    var model: AnimeModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AF.request("https://kitsu.io/api/edge/anime?page[limit]=20").response { response in
            debugPrint(response)
            guard let data = response.data else { return }
            let model = try! JSONDecoder().decode(AnimeModel.self, from: data)
            print(model)
            self.model = model
            self.tableView.reloadData()
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AnimeTreadingTableViewCell", for: indexPath) as? AnimeTreadingTableViewCell,
                let data = model?.data[indexPath.row],
                let url = URL(string: data.attributes.posterImage.medium) else { return UITableViewCell() }
        Nuke.loadImage(with: url, into: cell.animePosterimageView)
        cell.animeTitleLabel.text = data.attributes.canonicalTitle
        cell.animeSynobsisLabel.text = data.attributes.synopsis
        return cell
    }
}
