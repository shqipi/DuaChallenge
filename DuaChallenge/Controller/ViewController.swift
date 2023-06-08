//
//  ViewController.swift
//  DuaChallenge
//
//  Created by shqiperimramadani on 05.06.23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultsTableView: UITableView!
    var teamArray: [Team] = []
    var fixtures: [Match] = []
    var teamPoints: [String:Int] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
    }
    
    func setupTableView() {
        generateTeam()
        generateFixtures()
        generateRandomScoresAndPoints()
        
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        resultsTableView.register(UINib(nibName: "TeamCell", bundle: nil), forCellReuseIdentifier: "TeamCell")
        resultsTableView.reloadData()
        
        //        let sortedTeams = sortTeamsByPoints()
        //        for (index, team) in sortedTeams.enumerated() {
        //            let rank = index + 1
        //            let points = "\(teamPoints[team.points] ?? 0)"
        //            print("Rank \(rank): \(team), Points: \(points), with goal difference: ")
        //        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        guard let displayTeamsViewController = storyboard?.instantiateViewController(withIdentifier: "DisplayTeamsViewController") as? DisplayTeamsViewController else {
            return
        }
        
        let sortedTeams = sortTeamsByPoints()
        //        displayTeamsViewController.teamRankings = sortedTeams
        displayTeamsViewController.teamArray = sortedTeams
        displayTeamsViewController.teamPoints = teamPoints
        navigationController?.pushViewController(displayTeamsViewController, animated: true)
    }
}


//MARK: - Generating teams
extension ViewController {
    
    // Function to generated teams and append them to teamArray that is of type Team.
    func generateTeam() {
        let team1 = Team(name: "Team Dua1", points: 0, teamLogo: "arsenal", coachName: "", goalDifference: 0, city: "")
        teamArray.append(team1)
        let team2 = Team(name: "Team Dua2", points: 0, teamLogo: "bayern", coachName: "", goalDifference: 0, city: "")
        teamArray.append(team2)
        let team3 = Team(name: "Team Dua3", points: 0, teamLogo: "chelsea", coachName: "", goalDifference: 0, city: "")
        teamArray.append(team3)
        let team4 = Team(name: "Team Dua4", points: 0, teamLogo: "ajax", coachName: "", goalDifference: 0,city: "")
        teamArray.append(team4)
        let team5 = Team(name: "Team Dua5", points: 0, teamLogo: "manchester", coachName: "", goalDifference: 0,city: "")
        teamArray.append(team5)
        let team6 = Team(name: "Team Dua6", points: 0, teamLogo: "chelsea", coachName: "", goalDifference: 0,city: "")
        teamArray.append(team6)
        let team7 = Team(name: "Team Dua7", points: 0, teamLogo: "manchesterc", coachName: "", goalDifference: 0,city: "")
        teamArray.append(team7)
        let team8 = Team(name: "Team Dua8", points: 0, teamLogo: "milano", coachName: "", goalDifference: 0,city: "")
        teamArray.append(team8)
        let team9 = Team(name: "Team Dua9", points: 0, teamLogo: "juventus", coachName: "", goalDifference: 0,city: "")
        teamArray.append(team9)
        let team10 = Team(name: "Team Dua10", points: 0, teamLogo: "paris", coachName: "", goalDifference: 0,city: "")
        teamArray.append(team10)
        let team11 = Team(name: "Team Dua11", points: 0, teamLogo: "real", coachName: "", goalDifference: 0,city: "")
        teamArray.append(team11)
        let team12 = Team(name: "Team Dua12", points: 0, teamLogo: "roma", coachName: "", goalDifference: 0,city: "")
        teamArray.append(team12)
        let team13 = Team(name: "Team Dua13", points: 0, teamLogo: "barcelona", coachName: "", goalDifference: 0,city: "")
        teamArray.append(team13)
        let team14 = Team(name: "Team Dua14", points: 0, teamLogo: "inter", coachName: "", goalDifference: 0,city: "")
        teamArray.append(team14)
        let team15 = Team(name: "Team Dua15", points: 0, teamLogo: "bvb", coachName: "", goalDifference: 0,city: "")
        teamArray.append(team15)
        let team16 = Team(name: "Team Dua16", points: 0, teamLogo: "vlora", coachName: "", goalDifference: 0,city: "")
        teamArray.append(team16)
        let team17 = Team(name: "Team Dua17", points: 0, teamLogo: "celtic", coachName: "", goalDifference: 0,city: "")
        teamArray.append(team17)
        let team18 = Team(name: "Team Dua18", points: 0, teamLogo: "bilbao", coachName: "", goalDifference: 0,city: "")
        teamArray.append(team18)
        let team19 = Team(name: "Team Dua19", points: 0, teamLogo: "sporting", coachName: "", goalDifference: 0,city: "")
        teamArray.append(team19)
        let team20 = Team(name: "Team Dua20", points: 0, teamLogo: "tottenham", coachName: "", goalDifference: 0,city: "")
        teamArray.append(team20)
        
    }
}

//MARK: - Generating fixtures and score
extension ViewController {
    
    func generateFixtures(){
        
        for i in 0..<teamArray.count{
            for j in i+1..<teamArray.count {
                let homeSquad = teamArray[i]
                let awaySquad = teamArray[j]
                
                let firstMatch = Match(homeMatch: homeSquad, awayMatch: awaySquad)
                let secondMatch = Match(homeMatch: awaySquad, awayMatch: homeSquad)
                
                fixtures.append(firstMatch)
                fixtures.append(secondMatch)
            }
        }
        fixtures.shuffle()
        
    }
    
    func generateRandomScoresAndPoints() {
        for index in 0..<fixtures.count {
            let homeGoals = Int.random(in: 0...5)
            let awayGoals = Int.random(in: 0...5)
            
            fixtures[index].homeScore = homeGoals
            fixtures[index].awayScore = awayGoals
            
            let homeSquad = fixtures[index].homeMatch.name
            let awaySquad = fixtures[index].awayMatch.name
            
            if homeGoals > awayGoals {
                teamPoints[homeSquad, default: 0] += 3
                teamPoints[awaySquad, default: 0] += 0
            } else if homeGoals < awayGoals {
                teamPoints[homeSquad, default: 0] += 0
                teamPoints[awaySquad, default: 0] += 3
            } else {
                teamPoints[homeSquad, default: 0] += 1
                teamPoints[awaySquad, default: 0] += 1
            }
            
            let homeTeam = teamArray.first { $0.name == homeSquad }
            let awayTeam = teamArray.first { $0.name == awaySquad }
            
            homeTeam?.goalDifference += homeGoals - awayGoals
            awayTeam?.goalDifference += awayGoals - homeGoals
        }
    }
    
    func sortTeamsByPoints() -> [Team]{
        let sortedTeams = teamArray.sorted { team1, team2 in
            let points1 = teamPoints[team1.name] ?? 0
            let points2 = teamPoints[team2.name] ?? 0
            
            if points1 != points2 {
                return points1 > points2
            } else {
                return team1.goalDifference > team2.goalDifference
            }
        }
        
        return sortedTeams
    }
    
//    func calculateGoalDifference(for team: Team){
//        //        var goalDifference = 0
//        //        for match in fixtures {
//        //            if match.homeMatch.name == team {
//        //                goalDifference += match.homeScore - match.awayScore
//        //            } else if match.awayMatch.name == team {
//        //                goalDifference += match.awayScore - match.homeScore
//        //            }
//        //        }
//        //        print("This is goal difference: \(goalDifference)")
//        //        return goalDifference
//        for team in teamArray {
//            var goalDifference = 0
//            for match in fixtures {
//                if match.homeMatch.name == team.name {
//                    goalDifference += match.homeScore - match.awayScore
//                } else if match.awayMatch.name == team.name {
//                    goalDifference += match.awayScore - match.homeScore
//                }
//            }
//            team.goalDifference = goalDifference
//        }
//    }
}

//MARK: - TableView delegate methods
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCell") as! TeamCell
        let match = fixtures[indexPath.row]
        cell.textLabel?.text = "\(String(describing: match.homeMatch.name)) \t\t\(match.homeScore) - \(match.awayScore) \t\t \(String(describing: match.awayMatch.name))"
        return cell
        //        let team = teamArray[indexPath.row]
        //        let points = teamPoints[team.name] ?? 0
        //        let goalDifference = calculateGoalDifference(for: team.name)
        //
        //        cell.textLabel?.text = "\(team.name) \t\t Points: \(points) \t\t Goal Difference: \(goalDifference)"
        //        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

