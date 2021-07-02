//
//  BasicObject.swift
//  BasicCollectionView
//
//  Created by Abdullah Al-Ashi on 26/Oct/20.
//  Copyright © 2020 Abdullah Al-Ashi. All rights reserved.
//

import Foundation

protocol TypedObjectProtocol {
  var type: BasicObject.CellType { get }
}

typealias BasicTypedProtocol = BasicObjectProtocol & TypedObjectProtocol

struct BasicObject: BasicTypedProtocol {
  
  enum CellType {
    case basicCellOne
    case basicCellTwo
  }
  
  var image: String
  var title: String
  var subTitle: String
  var type: CellType = .basicCellOne
}

struct BasicHeader {
  var image: String
  var title: String
}

struct BasicFooter {
  var image: String
  var title: String
}

struct BasicCollectionSection {
  var header: BasicHeader?
  var items: [BasicObject] = []
  var footer: BasicFooter?
}
