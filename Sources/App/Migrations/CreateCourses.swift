//
//  CreateCourses.swift
//
//
//  Created by Developer IOS on 28/05/2024.
//

import Vapor
import Fluent

struct CreateCourses: AsyncMigration {
  
    
    func prepare(on database: any FluentKit.Database) async throws {
        
        try await database.schema("coureses")
        
            .id()
            .field("name",.string,.required)
            .field("logo",.string)
            .create()
    }
    
    func revert(on database: any FluentKit.Database) async throws {
        try await database.schema("coureses").delete()
    }
    
}
