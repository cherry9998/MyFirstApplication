//
//  MainViewController.swift
//  NCT
//
//  Created by 권채린 on 2021/01/16.
//  Copyright © 2021 권채린. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    // MVVM
    
    // Model
    // - NCTInfo
    // > NCTInfo 만들자
    
    // View
    // - GridCell
    // > GridCell 필요한 정보를 ViewModel한테서 받아야겠다
    // > GridCell은 ViewModel로 부터 받은 정보로 뷰 업데이트 하기
    
    // ViewModel
    // - NCTViewModel
    // > NCTViewModel을 만들고, 뷰레이어에서 필요한 메서드 만들기
    // > 모델 가지고 있기 ,, NCTInfo 들
    
    let viewModel = NCTViewModel()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                let NCTInfo = viewModel.NCTInfo(at: index)
                vc?.viewModel.update(model: NCTInfo)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfNCTInfoList
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as? GridCell else { return UICollectionViewCell() }
        
        let NCTInfo = viewModel.NCTInfo(at: indexPath.item)
         cell.update(info: NCTInfo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("--> \(indexPath.item)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing: CGFloat = 10
        let textAreaHeight: CGFloat = 100
        
        let width: CGFloat = (collectionView.bounds.width - itemSpacing)/2
        let height: CGFloat = width + textAreaHeight
        return CGSize(width: width, height: height)
    }
}

class GridCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var albumnameLabel: UILabel!
    @IBOutlet weak var teamnameLabel: UILabel!
    @IBOutlet weak var albumyearLabel: UILabel!
    
    func update(info: NCTInfo) {
        imgView.image = info.image
        albumnameLabel.text = info.albumName
        teamnameLabel.text = info.teamName
        albumyearLabel.text = "\(info.albumYear)"
    }
}
