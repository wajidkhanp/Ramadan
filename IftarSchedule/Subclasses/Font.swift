//
//  Font.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/16/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import Foundation
import UIKit

public final class Font: NSObject {
    @objc public static let displayLarge = UIFont.systemFont(ofSize: 44, weight: .thin)
    @objc public static let displayStandard = UIFont.systemFont(ofSize: 34, weight: .light)
    @objc public static let displaySmall = UIFont.systemFont(ofSize: 24, weight: .light)
    
    public static let xlarge02 = UIFont.systemFont(ofSize: 20, weight: .medium)
    @objc public static let xlarge01 = UIFont.systemFont(ofSize: 20, weight: .regular)
    
    @objc public static let large02 = UIFont.systemFont(ofSize: 16, weight: .medium)
    @objc public static let large01 = UIFont.systemFont(ofSize: 16, weight: .regular)
    
    @objc public static let standard03 = UIFont.systemFont(ofSize: 14, weight: .bold)
    @objc public static let standard02 = UIFont.systemFont(ofSize: 14, weight: .medium)
    @objc public static let standard01 = UIFont.systemFont(ofSize: 14, weight: .regular)
    
    @objc public static let small = UIFont.systemFont(ofSize: 12, weight: .medium)
}
