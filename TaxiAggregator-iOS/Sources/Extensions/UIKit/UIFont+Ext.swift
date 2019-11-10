//
// Created by Bogdan Sasko on 7/21/18.
// Copyright (c) 2018 Bogdan Sasko. All rights reserved.
//

import UIKit

extension UIFont {

    static func helvetica(weight: UIFont.Weight, fontSize: CGFloat) -> UIFont {
        switch weight {
        case .regular:
            return UIFont(name: "HelveticaNeue", size: fontSize)!
        default:
            assertionFailure()
            break
        }
        return UIFont.systemFont(ofSize: 14)
    }
    
    static func rubik(weight: UIFont.Weight, fontSize: CGFloat) -> UIFont {
        switch weight {
        case .regular:
            return UIFont(name: "Rubik-Regular", size: fontSize)!
        case .medium:
            return UIFont(name: "Rubik-Medium", size: fontSize)!
        default:
            assertionFailure()
            break
        }
        return UIFont.systemFont(ofSize: 14)
    }

    static func avenir(weight: UIFont.Weight, fontSize: CGFloat) -> UIFont {
        switch weight {
        case .medium:
            return UIFont(name: "Avenir-Medium", size: fontSize)!
        default:
            assertionFailure()
            break
        }
        return UIFont.systemFont(ofSize: 14)
    }

    
}
