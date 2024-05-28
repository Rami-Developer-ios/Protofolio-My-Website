//
//  CreateSkills.swift
//
//
//  Created by Developer IOS on 28/05/2024.
//


import Vapor
import Fluent

struct CreateSkills: AsyncMigration{
    
    func prepare(on database: any FluentKit.Database) async throws {
        
        try await database.schema("skills")
        
            .id()
            .field("name",.string)
            .field("persentage",.string)
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema("skills").delete()
    }
    
}
