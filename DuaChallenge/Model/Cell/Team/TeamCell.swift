//
//  TeamCell.swift
//  DuaChallenge
//
//  Created by shqiperimramadani on 05.06.23.
//

import UIKit

class TeamCell: UITableViewCell {
    
    @IBOutlet weak var team1Image: UIImageView!
    @IBOutlet weak var team1Name: UILabel!
    @IBOutlet weak var team1Score: UILabel!
    
    @IBOutlet weak var team2Image: UIImageView!
    @IBOutlet weak var team2Name: UILabel!
    @IBOutlet weak var team2Score: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDetails(team: Team) {
        team1Image.image = UIImage(named: team.teamLogo)
        team1Name.text = team.name
        team1Score.text = "\(team.points)"
        team2Image.image = UIImage(named: team.teamLogo)
        team2Name.text = team.name
        team2Score.text = "\(team.points)"
    }
    
}
