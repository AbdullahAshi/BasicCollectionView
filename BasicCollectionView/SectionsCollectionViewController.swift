//
//  SectionsCollectionViewController.swift
//  BasicCollectionView
//
//  Created by Abdullah Al-Ashi on 29/Nov/20.
//  Copyright © 2020 Abdullah Al-Ashi. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SectionsCollectionViewController: UIViewController {
  
  @IBOutlet private weak var collectionView: UICollectionView!
  var viewModel: BasicSectionsViewModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.register(BasicCollectionViewCell.nib(), forCellWithReuseIdentifier: BasicCollectionViewCell.identifier)
    
    //done from the storyboard
    //collectionView.delegate = self
    //collectionView.dataSource = self
    
    //flowlayout
    let flowlayout = UICollectionViewFlowLayout()
    flowlayout.itemSize = CGSize(width: 120, height: 120)
    collectionView.collectionViewLayout = flowlayout
    
    viewModel.viewDidLoad()
  }
}

extension SectionsCollectionViewController: BasicViewModelDelegate {
  func valuesDidChange() {
    print("values did change")
    collectionView.reloadData()
  }
}

extension SectionsCollectionViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: true)
    print("you tapped me")
  }
}

extension SectionsCollectionViewController: UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return viewModel.collectionObject.count
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.collectionObject[section].items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BasicCollectionViewCell.identifier, for: indexPath) as! BasicCollectionViewCell
    cell.configure(with: viewModel.collectionObject[indexPath.section].items[indexPath.item])
    return cell
  }
  
}

extension SectionsCollectionViewController: UICollectionViewDelegateFlowLayout {
  //this takes presedence over this : flowlayout.itemSize = CGSize(width: 120, height: 120)
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    // 1 then 2
//    var cellWidth = (UIScreen.main.bounds.width / 2) - 10
//    if indexPath.item % 3 == 0 {
//      cellWidth = UIScreen.main.bounds.width
//    }
    //
    
    
    // 1
    let cellWidth = UIScreen.main.bounds.width
    //
    
    // 2
//    let cellWidth = (UIScreen.main.bounds.width / 2) - 10
    //
    
    // 3
//    let cellWidth = (UIScreen.main.bounds.width / 3) - 10
    //
    
    return CGSize(width: cellWidth, height: cellWidth * 1.0125)
  }
}
