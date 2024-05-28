//
//  CreateTestimonials.swift
//
//
//  Created by Developer IOS on 28/05/2024.
//

import Vapor
import Fluent

struct CreateTestimonials:AsyncMigration {
    
    func prepare(on database: any FluentKit.Database) async throws {
        
        try await database.schema("testimonials")
            .id()
            .field("name",.string,.required)
            .field("info",.string,.required)
            .field("logo",.string,.required)
            .field("job",.string,.required)
            .create()
    }
    
    func revert(on database: any Database) async throws {
        
        try await database.schema("testimonials").delete()
    }
}
