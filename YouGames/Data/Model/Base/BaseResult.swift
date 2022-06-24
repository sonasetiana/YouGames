//
//  BaseResponse.swift
//  YouGames
//
//  Created by sona setiana on 24/06/22.
//

import Foundation
import SwiftUI

enum BaseResult<SUCCESS,FAILED>{
    case success(SUCCESS)
    case failed(FAILED)
}
