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
    collectionView.register(BasicHeaderCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BasicHeaderCollectionViewCell.identifier)
    collectionView.register(BasicFooterCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: BasicFooterCollectionViewCell.identifier)
    
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
    cell.viewModel = viewModel.collectionObject[indexPath.section].items[indexPath.item]
    return cell
  }
    
    // Support new header and footer in collection
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        switch kind {

        case UICollectionView.elementKindSectionHeader:

            let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BasicHeaderCollectionViewCell.identifier, for: indexPath) as! BasicHeaderCollectionViewCell
            headerCell.textLabel.text = viewModel.collectionObject[indexPath.section].header?.title
            return headerCell

        case UICollectionView.elementKindSectionFooter:
            
            let footerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BasicFooterCollectionViewCell.identifier, for: indexPath) as! BasicFooterCollectionViewCell
            footerCell.textLabel.text = viewModel.collectionObject[indexPath.section].footer?.title
                        
            return footerCell

        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            return CGSize(width: 0, height: 80.0) // scroll direction decides which of width or height is used
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
            return CGSize(width: 0, height: 40.0) // scroll direction decides which of width or height is used
    }
    
    // Only top and bottom spaced if vertical scrolling (dependent on scroll direction)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 20, left: -20, bottom: 20, right: -20)
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
