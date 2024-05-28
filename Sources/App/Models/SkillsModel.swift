//
//  SkillsModel.swift
//
//
//  Created by Developer IOS on 19/05/2024.
//

import Vapor
import Fluent
import struct Foundation.UUID

/// Property wrappers interact poorly with `Sendable` checking, causing a warning for the `@ID` property
/// It is recommended you write your model with sendability checking on and then suppress the warning
/// afterwards with `@unchecked Sendable`.
///
///
final class SkillsModel:Model ,@unchecked Sendable{
  
    static let schema =  "skills"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name:String?
    
    @Field(key: "persentage")
    var persentage:String?
    
//    @Field(key: "yearsExperianxe")
//    var yearsExperianxe: String
//    
//    @Field(key: "projectNum")
//    var projectNum: String
    
    init() {
        
    }
    init(id: UUID? = nil, name: String?, persentage: String?) {
        self.id = id
        self.name = name
        self.persentage = persentage
//        self.yearsExperianxe = yearsExperianxe
//        self.projectNum = projectNum
    }
    
}
extension SkillsModel:Content{}
