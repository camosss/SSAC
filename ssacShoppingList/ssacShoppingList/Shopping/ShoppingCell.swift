//
//  ShoppingCell.swift
//  ssacShoppingList
//
//  Created by 강호성 on 2021/10/14.
//

import UIKit

class ShoppingCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var listLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var starButton: UIButton!
    
    var check: Bool = false
    var star: Bool = false
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // MARK: - Action
    
    @IBAction func tapCheck(_ sender: UIButton) {
        
        if !check {
            check = true
            checkButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        } else {
            check = false
            checkButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
        
    }
    
    @IBAction func tapStar(_ sender: UIButton) {
        
        if !star {
            star = true
            starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            star = false
            starButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
}
