//
//  TestimonialsModel.swift
//
//
//  Created by Developer IOS on 28/05/2024.
//

import Vapor
import Fluent

final class TestimonialsModel: Model,@unchecked Sendable{
  
    
    static let schema = "testimonials"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "info")
    var info: String

    @Field(key: "logo")
    var logo: String?
    
    @Field(key: "job")
    var job: String
    
    init() {
        
    }
    init(id: UUID? = nil, name: String, info: String, logo: String? = nil, job: String) {
        self.id = id
        self.name = name
        self.info = info
        self.logo = logo
        self.job = job
    }
    
}
extension TestimonialsModel:Content{

}
