//
//  DetailViewController.swift
//  NCT
//
//  Created by 권채린 on 2021/01/16.
//  Copyright © 2021 권채린. All rights reserved.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let viewModel = DetailViewModel()
      
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numOfTrackList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        let NCTInfo = viewModel.NCTInfo!
        cell.update(info: NCTInfo)
        print(indexPath.row)
        cell.musicLabel?.text = viewModel.NCTInfo?.musicList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playerStoryboard = UIStoryboard.init(name: "Player", bundle: nil)
        guard let playerVC = playerStoryboard.instantiateViewController(identifier: "PlayerViewController") as? PlayerViewController else { return }
//        let item = viewModel.NCTInfo?.musicList[indexPath.row]
//        playerVC.simplePlayer.replaceCurrentItem(with: item)
//        present(playerVC, animated: true, completion: nil)
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var musicLabel: UILabel!
    @IBOutlet weak var teamnameLabel: UILabel!
    
    func update(info: NCTInfo) {
        imgView.image = info.image
        teamnameLabel.text = info.teamName
    }
}

class DetailViewModel {
    var NCTInfo: NCTInfo?
    
    var numOfTrackList: Int {
        guard let count = NCTInfo?.musicList.count else { return 0 }
        return count
    }
    
    func update(model: NCTInfo?) {
        NCTInfo = model
    }
    
    var trackList: [String] {
        guard let trackList = NCTInfo?.musicList else { return [] }
        return trackList
    }
}

class searchAPI {
    static func search(_ term: String, completion: @escaping ([Movie]) -> Void) {
        let session = URLSession(configuration: .default)
        var urlComponents = URLComponents(string: "e")!
        let mediaQuery = URLQueryItem(name: "media", value: "music")
        let entityQuery = URLQueryItem(name: "entity", value: "song")
        let termQuery = URLQueryItem(name: "term", value: term)
        urlComponents.queryItems?.append(mediaQuery)
        urlComponents.queryItems?.append(entityQuery)
        urlComponents.queryItems?.append(termQuery)
        
        let requestURL = urlComponents.url!
        
        let dataTask = session.dataTask(with: requestURL) { data, response, error in
            let successRange = 200..<300
            guard error == nil,
                let statusCode = (response as? HTTPURLResponse)?.statusCode,
                successRange.contains(statusCode) else {
                    completion([])
                    return
            }
            
            guard let resultData = data else {
                completion([])
                return
            }
            
            let movies = SearchAPI.parseMovies(resultData)
            completion(movies)
        }
        dataTask.resume()
    }
    
    static func parseMovies(_ data: Data) -> [Movie] {
        let decoder = JSONDecoder()

        do {
            let response = try decoder.decode(Response.self, from: data)
            let movies = response.movies
            return movies
        } catch let error {
            print("--> parsing error: \(error.localizedDescription)")
            return []
        }
    }}
