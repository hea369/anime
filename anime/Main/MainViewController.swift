//
//  MainViewController.swift
//  anime
//
//  Created by 박호현 on 2022/05/13.
//

import UIKit
import Nuke

class MainViewController: UIViewController {
    let animeTitles: [String] = ["전생슬", "그랑죠", "원피스", "소아온", "귀칼", "나루토", "나의 히어로 아카데미"]
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animeTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AnimeTreadingTableViewCell", for: indexPath) as? AnimeTreadingTableViewCell, let url = URL(string: "https://picsum.photos/200/30\(indexPath.row)") else { return UITableViewCell() }
        
        Nuke.loadImage(with: url, into: cell.animePosterimageView)
        cell.animeTitleLabel.text = animeTitles[indexPath.row]
        cell.animeSynobsisLabel.text = "설명입니다설명입니다설명입니다설명입니다설명입니다설명입니다설명입니다설명입니다설명입니다"
        return cell
    }
}
