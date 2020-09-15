//
//  ViewCodeProtocol.swift
//  The Movie
//
//  Created by Marcelo Silva Honorio on 15/09/20.
//  Copyright © 2020 Mhonorio92. All rights reserved.
//

import Foundation

protocol ViewCodePrococol: class {
    func viewCodeSetup()
    func viewCodeHierarchySetup()
    func viewCodeConstraintSetup()
    func viewCodeThemeSetup()
    func viewCodeAdditionalSetup()
}


extension ViewCodePrococol {
    
    func viewCodeSetup() {
        viewCodeHierarchySetup()
        viewCodeConstraintSetup()
        viewCodeThemeSetup()
        viewCodeAdditionalSetup()
    }
    
    func viewCodeThemeSetup() {}
    
    func viewCodeAdditionalSetup() {}
}
