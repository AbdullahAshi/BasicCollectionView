//
//  BasicViewModel.swift
//  BasicCollectionView
//
//  Created by Abdullah Al-Ashi on 26/Oct/20.
//  Copyright © 2020 Abdullah Al-Ashi. All rights reserved.
//

import Foundation
import UIKit

class BasicSectionsViewModel {
  
  private let object1 = BasicObject(image: "1", title: "car 1 title", subTitle: "car 1 subtitle", type: .basicCellOne)
  private let object2 = BasicObject(image: "2", title: "car 2 title", subTitle: "car 2 subtitle", type: .basicCellOne)
  private let object3 = BasicObject(image: "3", title: "car 3 title", subTitle: "car 3 subtitle", type: .basicCellOne)
  private let object4 = BasicObject(image: "4", title: "car 4 title", subTitle: "car 4 subtitle", type: .basicCellOne)
  private let object5 = BasicObject(image: "5", title: "car 5 title", subTitle: "car 5 subtitle", type: .basicCellOne)
  private let object6 = BasicObject(image: "6", title: "car 6 title", subTitle: "car 6 subtitle", type: .basicCellOne)
  private let object7 = BasicObject(image: "7", title: "car 7 title", subTitle: "car 7 subtitle", type: .basicCellOne)
  private let object8 = BasicObject(image: "8", title: "car 8 title", subTitle: "car 8 subtitle", type: .basicCellOne)
  private let object9 = BasicObject(image: "9", title: "car 9 title", subTitle: "car 9 subtitle", type: .basicCellOne)
  private let object10 = BasicObject(image: "10", title: "car 10 title", subTitle: "car 10 subtitle", type: .basicCellOne)
  
  weak var delegateViewController: BasicViewModelDelegate!
  
  var collectionObject: [BasicCollectionSection] = [] {
    didSet {
      self.delegateViewController?.valuesDidChange()
    }
  }
  
  func viewDidLoad() {
    var runCount = 0
    collectionObject = [BasicCollectionSection(header: nil, items: [object5, object3, object1, object9], footer: nil)]
    let _ = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { [weak self] timer in
      
      guard let self = self else { return }
      
      switch runCount {
      case 0:
        print("0")
        self.collectionObject = [BasicCollectionSection(header: BasicHeader(image: "0", title: "section 1 header title"),
                                                        items: [self.object1, self.object2, self.object4, self.object5, self.object7],
                                                        footer: BasicFooter(image: "0", title: "section 1 footer title"))]
      case 1:
        self.collectionObject = [BasicCollectionSection(header: BasicHeader(image: "0", title: "section 1 header title"),
                                                        items: [self.object6, self.object7, self.object9, self.object5, self.object8, self.object1],
                                                        footer: BasicFooter(image: "0", title: "section 1 footer title")),
                                 BasicCollectionSection(header: BasicHeader(image: "0", title: "section 2 header title"),
                                                                                 items: [self.object3, self.object4, self.object2, self.object5, self.object9],
                                                                                 footer: BasicFooter(image: "0", title: "section 2 footer title"))]
      case 2:
        print("2")
//        self.collectionObject = [self.object3, self.object4, self.object5, self.object6, self.object7, self.object10]
      default:
        break
      }
      
      if runCount == 3 {
        timer.invalidate()
      }
      runCount += 1
      
    }
  }
  
}
