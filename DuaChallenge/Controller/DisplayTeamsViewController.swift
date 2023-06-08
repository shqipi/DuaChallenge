//
//  DisplayTeamsViewController.swift
//  DuaChallenge
//
//  Created by shqiperimramadani on 05.06.23.
//

import UIKit

class DisplayTeamsViewController: UIViewController {
    
    @IBOutlet weak var displayTeams: UITableView!
    
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
        cell.textLabel?.text = " \(rank). \(teamName.name)   \t Points: \(score)   \twith gd: \(goalDifference)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let team = teamArray[indexPath.row]
        let score = teamPoints[team.name] ?? 0
        
        let alertController = UIAlertController(title: team.name, message: nil, preferredStyle: .alert)
        
        let imageView = UIImageView(frame: CGRect(x:110, y: 40, width: 55, height: 55))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: team.teamLogo)
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.clipsToBounds = true
        
        alertController.view.addSubview(imageView)
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        alertController.message = "\n\n\n\n Coach: \(team.coachName)\nPoints: \(score)\nGoal Difference: \(team.goalDifference)\nCity: \(team.city)"
        
        present(alertController, animated: true, completion: nil)
    }
    
}
