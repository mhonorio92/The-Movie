//
//  HeaderCollectionReusableView.swift
//  The Movie
//
//  Created by Marcelo Silva Honorio on 15/09/20.
//  Copyright © 2020 Mhonorio92. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "sampleImage"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewCodeSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderCollectionReusableView: ViewCodePrococol {
    func viewCodeHierarchySetup() {
        addSubview(imageView)
    }
    
    func viewCodeConstraintSetup() {
        imageView.fillSuperview(padding: .init(top: 0, left: 0, bottom: 250, right: 0))
        imageView.sizeToFit()
    }
    
    
}
