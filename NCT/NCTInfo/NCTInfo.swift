//
//  NCTInfo.swift
//  NCT
//
//  Created by 권채린 on 2021/01/16.
//  Copyright © 2021 권채린. All rights reserved.
//

import UIKit

struct NCTInfo {
    let albumName: String
    let teamName: String
    let albumYear: Int
    let musicList: [String]
    
    var image: UIImage? {
        return UIImage(named: "\(albumName).jpg")
    }
    
    init(albumName: String, teamName:String, albumYear: Int, musicList: [String]) {
        self.albumName = albumName
        self.teamName = teamName
        self.albumYear = albumYear
        self.musicList = musicList
    }
    
}
