//
//  BasicCollectionViewCell.swift
//  BasicCollectionView
//
//  Created by Abdullah Al-Ashi on 25/Oct/20.
//  Copyright © 2020 Abdullah Al-Ashi. All rights reserved.
//

import UIKit

protocol BasicObjectProtocol {
  var image: String { get }
  var title: String { get }
  var subTitle: String { get }
}

class BasicCollectionViewCell: UICollectionViewCell {

  @IBOutlet private weak var imageView: UIImageView!
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var subTitleLabel: UILabel!
  
  static let identifier: String = "BasicCollectionViewCell"
  
    var viewModel: BasicObjectProtocol? {
        didSet {
            assert(viewModel != nil)
            configure(with: viewModel!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
  private func configure(with object: BasicObjectProtocol) {
    imageView.image = UIImage(named: object.image)
    titleLabel.text = object.title
    subTitleLabel.text = object.subTitle
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    imageView.image = nil
    titleLabel.text = ""
    subTitleLabel.text = ""
  }
  
  static func nib() -> UINib {
    return UINib(nibName: "BasicCollectionViewCell", bundle: nil)
  }

}
