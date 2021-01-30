//
//  NCTViewModel.swift
//  NCT
//
//  Created by 권채린 on 2021/01/16.
//  Copyright © 2021 권채린. All rights reserved.
//

import UIKit

class NCTViewModel {
    let NCTInfoList: [NCTInfo] = [
        NCT.NCTInfo(albumName: "EMPATHY", teamName: "NCT 2018", albumYear: 2018, musicList: ["INTRO: Neo Got My Back", "BOSS", "Baby Don’t Stop", "GO", "TOUCH", "YESTODAY", "Black on Black", "텐데…(Timeless)", "일곱 번째 감각", "WITHOUT YOU", "몽중몽", "OUTRO: VISION", "YESTODAY(Extended Ver.)"]),
        NCT.NCTInfo(albumName: "RESONANCE Pt.1", teamName: "NCT 2020", albumYear: 2020, musicList: ["Make A Wish", "Misfit", "Volcano", "백열등", "Dancing In The Rain", "Interlude: Past to Present", "무대로", "Nectar", "Music, Dance", "피아노", "From Home", "From Home(Korean Ver.)", "Make A Wish(English Ver.)"]),
        NCT.NCTInfo(albumName: "RESONANCE Pt.2", teamName: "NCT 2020", albumYear: 2020, musicList: ["90's love", "Raise The Roof", "My Everything", "Interlude: Present to Future", "Work It", "단잠(All About You)", "I.O.U", "Outro: Dream Routine"]),
        NCT.NCTInfo(albumName: "NCT #127", teamName: "NCT 127", albumYear: 2016, musicList: ["소방차(Fire Truck)", "Once Again(여름 방학)", "Wake Up", "Another World", "Paradise", "Mad City", "Switch(ft. SR15B)"]),
        NCT.NCTInfo(albumName: "LIMITLESS", teamName: "NCT 127", albumYear: 2017, musicList: ["무한적아; Limitless", "Good Thing", "Back 2 U(AM 01:27)", "롤러코스터(Heartbreaker)", "Baby Don't Like It(나쁜 짓)", "Angel"]),
        NCT.NCTInfo(albumName: "CHERRY BOMB", teamName: "NCT 127", albumYear: 2017, musicList: ["Cherry Bomb", "Running 2 U", "0 Mile", "Sun & Moon", "Whiplash", "Summer 127", "Cherry Bomb(Performance Ver.)"]),
        NCT.NCTInfo(albumName: "Regular-Irregular", teamName: "NCT 127", albumYear: 2018, musicList: ["지금 우리(City 127)", "Regular(Korean Ver.)", "Replay(PM 01:27)", "Knock on", "나의 모든 순간(No Longer)", "Interlude: Regular to Irregular", "내 Van(My Van)", "악몽(Come Back)", "신기루(Fly Away With Me)", "Regular(English Ver.)", "Run Back 2 U"]),
        NCT.NCTInfo(albumName: "Regulate", teamName: "NCT 127", albumYear: 2018, musicList: ["Welcome To My Playground", "Simon Says", "Chain (Korean Ver.)"]),
        NCT.NCTInfo(albumName: "WE ARE SUPERHUMAN", teamName: "NCT 127", albumYear: 2019, musicList: ["Highway to Heaven", "Superhuman", "아 깜짝이야 (FOOL)", "시차 (Jet Lag)", "종이비행기 (Paper Plane)", "OUTRO : WE ARE 127"]),
        NCT.NCTInfo(albumName: "Neo Zone", teamName: "NCT 127", albumYear: 2020, musicList: ["Elevator (127F)", "영웅 (英雄; Kick It)", "꿈 (Boom)", "낮잠 (Pandora’s Box)", "Day Dream (白日夢)", "Interlude: Neo Zone", "뿔 (MAD DOG)", "Sit Down!", "메아리 (Love Me Now)", "우산 (Love Song)", "백야 (White Night)", "Not Alone", "Dreams Come True"]),
        NCT.NCTInfo(albumName: "Neo Zone The Final Round", teamName: "NCT 127", albumYear: 2020, musicList: ["Punch", "NonStop", "서곡 (序曲; Prelude)", "너의 하루 (Make Your Day)"]),
        NCT.NCTInfo(albumName: "THE FIRST", teamName: "NCT DREAM", albumYear: 2017, musicList: ["마지막 첫사랑", "덩크슛", "Chewing Gum"]),
        NCT.NCTInfo(albumName: "We Young", teamName: "NCT DREAM", albumYear: 2017, musicList: ["We Young", "La La Love", "같은 시간 같은 자리", "My Page", "We Young (Chinese ver.)", "Trigger The Fever"]),
        NCT.NCTInfo(albumName: "We Go Up", teamName: "NCT DREAM", albumYear: 2018, musicList: ["We Go Up", "1, 2, 3", "너와 나 (Beautiful Time)", "Drippin'", "Dear DREAM", "We Go Up (靑春接力) (Chinese ver.)"]),
        NCT.NCTInfo(albumName: "We Boom", teamName: "NCT DREAM", albumYear: 2019, musicList: ["BOOM", "STRONGER", "119", "사랑이 좀 어려워 (Bye My First...)", "Best Friend", "Dream Run"]),
        NCT.NCTInfo(albumName: "RELOAD", teamName: "NCT DREAM", albumYear: 2020, musicList: ["Ridin'", "Quiet Down", "내게 말해줘 (7 Days)", "사랑은 또다시(Love Again)", "너의 자리 (Puzzle Piece)"]),
        NCT.NCTInfo(albumName: "Take Off", teamName: "Way V", albumYear: 2019, musicList: ["Take Off", "Regular", "Say It", "Comeback", "Let Me Love u", "Dream Launch"]),
        NCT.NCTInfo(albumName: "Take Over The Moon", teamName: "Way V", albumYear: 2019, musicList: ["Moonwalk", "Yeah Yeah Yeah", "Love Talk", "King of Hearts", "Face to Face", "We go nanana"]),
        NCT.NCTInfo(albumName: "Awaken The World", teamName: "Way V", albumYear: 2020, musicList: ["Turn Back Time", "Bad Alive", "Unbreakable", "After Midnight", "Interlude: Awaken The World", "Only Human", "Domino", "Up From Here", "Electric Hearts", "Stand By Me"])
        ]
    
    var sortedList: [NCTInfo] {
        let sortedList = NCTInfoList.sorted { prev, next in
            return prev.albumYear < next.albumYear }
        return sortedList
    }
    
    var numOfNCTInfoList: Int {
        return NCTInfoList.count
    }
    
    func NCTInfo(at index: Int) -> NCTInfo {
        return sortedList[index]
    }
}

