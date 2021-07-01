//
//  CollectionViewController.swift
//  BasicCollectionView
//
//  Created by Abdullah Al-Ashi on 25/Oct/20.
//  Copyright © 2020 Abdullah Al-Ashi. All rights reserved.
//

import UIKit

let basicCellReuseIdentifier = "BasicCollectionViewCell"

class CollectionViewController: UICollectionViewController {
  var viewModel: BasicViewModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Register cell classes
    collectionView.register(BasicCollectionViewCell.nib(), forCellWithReuseIdentifier: BasicCollectionViewCell.identifier)
    collectionView.register(BasicHeaderCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BasicHeaderCollectionViewCell.identifier)
    collectionView.register(BasicFooterCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: BasicFooterCollectionViewCell.identifier)

    
    //done from the storyboard
    collectionView.delegate = self
    collectionView.dataSource = self
    
    //flowlayout
    let flowlayout = UICollectionViewFlowLayout()
    flowlayout.itemSize = CGSize(width: 120, height: 120)
    collectionView.collectionViewLayout = flowlayout
    
    viewModel.viewDidLoad()
  }
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using [segue destinationViewController].
   // Pass the selected object to the new view controller.
   }
   */
  
  // MARK: UICollectionViewDataSource
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of items
    return viewModel.objects.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BasicCollectionViewCell.identifier, for: indexPath) as! BasicCollectionViewCell
    cell.configure(with: viewModel.objects[indexPath.item])
    return cell
  }
  
    // Support new header and footer in collection
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        switch kind {

        case UICollectionView.elementKindSectionHeader:

            let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BasicHeaderCollectionViewCell.identifier, for: indexPath) as! BasicHeaderCollectionViewCell
                        
            return headerCell

        case UICollectionView.elementKindSectionFooter:
            
            let footerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BasicFooterCollectionViewCell.identifier, for: indexPath) as! BasicFooterCollectionViewCell
                        
            return footerCell

        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
            return CGSize(width: 0, height: 80.0) // scroll direction decides which of width or height is used
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
            return CGSize(width: 0, height: 40.0) // scroll direction decides which of width or height is used
    }
    
  // MARK: UICollectionViewDelegate
  
  /*
   // Uncomment this method to specify if the specified item should be highlighted during tracking
   override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
   return true
   }
   */
  
  /*
   // Uncomment this method to specify if the specified item should be selected
   override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
   return true
   }
   */
  
  /*
   // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
   override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
   return false
   }
   
   override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
   return false
   }
   
   override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
   
   }
   */
  
}

// MARK: BasicViewModelDelegate

extension CollectionViewController: BasicViewModelDelegate {
  func valuesDidChange() {
    print("values did change")
    collectionView.reloadData()
  }
}

// MARK: UICollectionViewDelegateFlowLayout

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
  //this takes presedence over this : flowlayout.itemSize = CGSize(width: 120, height: 120)
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    var cellWidth = (UIScreen.main.bounds.width / 2) - 10
    if indexPath.item % 3 == 0 {
      cellWidth = UIScreen.main.bounds.width
    }
    return CGSize(width: cellWidth, height: cellWidth * 1.0125)
  }
}
