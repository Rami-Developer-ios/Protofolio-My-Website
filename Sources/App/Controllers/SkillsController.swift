//
//  SkillsController.swift
//  
//
//  Created by Developer IOS on 28/05/2024.
//

import Vapor
import Fluent

struct SkillsController: RouteCollection {
    
    func boot(routes: any Vapor.RoutesBuilder) throws {
        
        let route = routes.grouped("Skills")
        
        route.group("info") {  req in
            
            req.get(use: {try await getSkills(req: $0)})
            req.post(use: {try await addSkills(req: $0)})
        }
//        route.get(":userID", use:{ try await getHandler($0)})
//        
//        route.group(":todoID") { todo in
//            todo.delete(use: { try await self.delete(req: $0) })
//        }
    }
    
    func getSkills(req:Request) async throws -> [SkillsModel] {
        
        let data = try await SkillsModel.query(on: req.db).all()
        
        return data
    }
    func addSkills(req:Request) async throws -> SkillsModel {
        
        let data = try req.query.decode(SkillsModel.self)
        
        try await data.save(on: req.db)
        
        return data
    }
    
    func getHandler(_ req: Request) async throws -> SkillsModel {
        
        guard let user = try await SkillsModel.find(req.parameters.get("userID"), on: req.db) else{
            throw Abort(.notFound)
        }
        return user
    }
    
    func delete(req: Request) async throws -> HTTPStatus {
        
        guard let todo = try await SkillsModel.find(req.parameters.get("todoID"), on: req.db) else {
            throw Abort(.notFound)
        }
        
        try await todo.delete(on: req.db)
        return .noContent
    }
}
