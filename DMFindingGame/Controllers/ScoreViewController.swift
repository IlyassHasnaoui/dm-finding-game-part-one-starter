//
//  ScoreViewController.swift
//  DMFindingGame
//
//  Created by Ilyass Hasnaoui on 1/2/24.
//

import UIKit

class ScoreViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var score = [Score]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        score = CoreDataManager.shared.fetchScores()
        tableView.reloadData()

    }
    
    func configureTableView() {
        tableView.dataSource = self
    }
    
}

extension ScoreViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return score.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scoreCell", for: indexPath)
        
        let score = score[indexPath.row].score
        
        var content = cell.defaultContentConfiguration()
        content.text = String(score)
        cell.contentConfiguration = content
        
        return cell
    }
}
