//
//  MangeViewController.swift
//  anime
//
//  Created by 박호현 on 2022/05/19.
//

import Nuke
import Alamofire
import UIKit

class MangeViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var model: AnimeModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AF.request("https://kitsu.io/api/edge/manga").response { response in
            debugPrint(response)
            guard let data = response.data else { return }
            let model = try! JSONDecoder().decode(AnimeModel.self, from: data)
            print(model)
            self.model = model
            self.tableView.reloadData()
        }
    }
    
}

extension MangeViewController: UITableViewDelegate, UITableViewDataSource {
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
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let url = model?.links.next,
              indexPath.row == (model?.data.count ?? 0) - 1 else { return }
        AF.request(url).response { response in
            debugPrint(response)
            guard let data = response.data else { return }
            let model = try! JSONDecoder().decode(AnimeModel.self, from: data)
            print(model)
            self.model?.data.append(contentsOf: model.data)
            self.model?.links = model.links
            tableView.reloadData()
        }
    }
}

