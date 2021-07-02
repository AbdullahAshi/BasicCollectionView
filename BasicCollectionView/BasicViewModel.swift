//
//  BasicViewModel.swift
//  BasicCollectionView
//
//  Created by Abdullah Al-Ashi on 26/Oct/20.
//  Copyright © 2020 Abdullah Al-Ashi. All rights reserved.
//

import Foundation

protocol BasicViewModelDelegate: class {
  func valuesDidChange()
}

class BasicViewModel {
  
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
  
  var objects: [BasicObject] = [] {
    didSet {
      self.delegateViewController?.valuesDidChange()
    }
  }
  
  func viewDidLoad() {
    var runCount = 0
    objects = [object5, object3, object1, object9]
    let _ = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { [weak self] timer in
      
      guard let self = self else { return }
      
      switch runCount {
      case 0:
        print("0")
        self.objects = [self.object1, self.object2, self.object4, self.object5, self.object7]
      case 1:
        print("1")
        self.objects = [self.object4, self.object9, self.object10]
      case 2:
        print("2")
        self.objects = [self.object3, self.object4, self.object5, self.object6, self.object7, self.object10]
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
