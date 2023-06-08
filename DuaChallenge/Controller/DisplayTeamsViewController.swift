//
//  DisplayTeamsViewController.swift
//  DuaChallenge
//
//  Created by shqiperimramadani on 05.06.23.
//

import UIKit

class DisplayTeamsViewController: UIViewController {
    
    @IBOutlet weak var displayTeams: UITableView!
    @IBOutlet weak var teamLogoImageView: UIImageView!
    
    var teamRankings: [Team?] = []
    var teamPoints: [String: Int] = [:]
    var teamArray: [Team] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
    }
    
    func setupTableView() {
        displayTeams.delegate = self
        displayTeams.dataSource = self
        displayTeams.register(UINib(nibName: "DisplayTableViewCell", bundle: nil), forCellReuseIdentifier: "DisplayTableViewCell")
        displayTeams.reloadData()
    }
    
}

extension DisplayTeamsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DisplayTableViewCell") as! DisplayTableViewCell
         let teamName = teamArray[indexPath.row]
            let rank = indexPath.row + 1
            let score = teamPoints[teamName.name] ?? 0
            let goalDifference = teamName.goalDifference
            cell.textLabel?.text = " \(rank). \(teamName.name)   \t Scored: \(score)   \twith gd: \(goalDifference)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let team = teamArray[indexPath.row]
            let score = teamPoints[team.name] ?? 0
            
            let alertController = UIAlertController(title: team.name, message: nil, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            // Customize the alert controller as per your needs
            alertController.message = "Team Logo: \(team.teamLogo)\nCoach: \(team.coachName)\nGoals Scored: \(score)\nGoal Difference: \(team.goalDifference)\nCity: \(team.city)"
            
            present(alertController, animated: true, completion: nil)
        }
    
}
