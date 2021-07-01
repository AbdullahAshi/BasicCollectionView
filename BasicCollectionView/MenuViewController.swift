//
//  ViewController.swift
//  BasicCollectionView
//
//  Created by Abdullah Al-Ashi on 24/Oct/20.
//  Copyright © 2020 Abdullah Al-Ashi. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "SingleColumnViewPush" {
      if let singleColumnCollectionViewController = segue.destination as? SingleColumnCollectionViewController {
        let basicViewModel = BasicViewModel()
        basicViewModel.delegateViewController = singleColumnCollectionViewController
        singleColumnCollectionViewController.viewModel = basicViewModel
      }
    }
    
    if segue.identifier == "CollectionViewControllerPush" {
      if let collectionViewController = segue.destination as? CollectionViewController {
        let basicViewModel = BasicViewModel()
        basicViewModel.delegateViewController = collectionViewController
        collectionViewController.viewModel = basicViewModel
      }
    }
    
    if segue.identifier == "SectionsCollectionViewPush" {
      if let collectionViewController = segue.destination as? SectionsCollectionViewController {
        let basicSectionsViewModel = BasicSectionsViewModel()
        basicSectionsViewModel.delegateViewController = collectionViewController
        collectionViewController.viewModel = basicSectionsViewModel
      }
    }
  }
}

