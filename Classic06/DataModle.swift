//
//  DataModle.swift
//  Classic06
//
//  Created by 暨大附中4 on 2021/9/24.
//

import Foundation
import SwiftUI
import Combine

class Age:ObservableObject {
    @Published var number:Int =  0
    @Published var ONOFF:Bool =  false
}
//@
