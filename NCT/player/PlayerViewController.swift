//
//  PlayerViewController.swift
//  NCT
//
//  Created by 권채린 on 2021/01/29.
//  Copyright © 2021 권채린. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var totalDurationLabel: UILabel!
    @IBOutlet weak var playControlButton: UIButton!
    
    let simplePlayer = SimplePlayer.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
