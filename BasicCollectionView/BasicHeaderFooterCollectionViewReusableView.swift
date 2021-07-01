//
//  BasicHeaderFooterCollectionViewCell.swift
//  BasicCollectionView
//
//  Created by Abdullah Al-Ashi on 29/6/21.
//  Copyright © 2021 Abdullah Al-Ashi. All rights reserved.
//

import UIKit

class BasicHeaderFooterCollectionViewCell: UICollectionReusableView {
    
    weak var textLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        textLabel = label
        textLabel.textAlignment = .center
        
        backgroundColor = .systemBlue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class BasicHeaderCollectionViewCell: BasicHeaderFooterCollectionViewCell {
    static let identifier: String = "BasicHeaderCollectionViewCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        textLabel.text = "Header"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class BasicFooterCollectionViewCell: BasicHeaderFooterCollectionViewCell {
    static let identifier: String = "BasicFooterCollectionViewCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        textLabel.text = "Footer"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
