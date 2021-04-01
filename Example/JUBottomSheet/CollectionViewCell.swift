//
//  CollectionViewCell.swift
//  JUBottomSheet_Example
//
//  Created by Ik ju Song on 2021/04/01.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
