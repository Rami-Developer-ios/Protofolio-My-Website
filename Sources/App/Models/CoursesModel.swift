//
//  CoursesModel.swift
//
//
//  Created by Developer IOS on 28/05/2024.
//

import Vapor
import Fluent

/// Property wrappers interact poorly with `Sendable` checking, causing a warning for the `@ID` property
/// It is recommended you write your model with sendability checking on and then suppress the warning
/// afterwards with `@unchecked Sendable`.
///
///
final class CoursesModel:Model,@unchecked Sendable{
   
    
    static let schema =  "coureses"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "logo")
    var logo: String?
    
    init() {
        
    }
    init(id: UUID? = nil, name: String, logo: String? = nil) {
        self.id = id
        self.name = name
        self.logo = logo
    }
    
}

extension CoursesModel:Content{}
