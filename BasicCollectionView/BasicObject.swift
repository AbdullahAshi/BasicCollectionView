//
//  BasicObject.swift
//  BasicCollectionView
//
//  Created by Abdullah Al-Ashi on 26/Oct/20.
//  Copyright © 2020 Abdullah Al-Ashi. All rights reserved.
//

import Foundation
import UIKit

protocol TypedObjectProtocol {
  var type: BasicObject.CellType { get }
}

typealias BasicTypedProtocol = BasicObjectProtocol & TypedObjectProtocol

struct BasicObject: BasicTypedProtocol {
  
  enum CellType {
    case basicCellOne
    case basicCellTwo
  }
  
  var image: UIImage
  var title: String
  var subTitle: String
  var type: CellType = .basicCellOne
}

struct BasicHeader {
  var image: UIImage
  var title: String
}

struct BasicFooter {
  var image: UIImage
  var title: String
}

struct BasicCollectionSection {
  var header: BasicHeader?
  var items: [BasicObject] = []
  var footer: BasicFooter?
}
