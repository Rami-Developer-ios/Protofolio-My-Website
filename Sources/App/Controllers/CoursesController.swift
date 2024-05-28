//
//  CoursesController.swift
//  
//
//  Created by Developer IOS on 28/05/2024.
//

import Vapor
import Fluent

struct CoursesController: RouteCollection {
    
    func boot(routes: any Vapor.RoutesBuilder) throws {
        
        let route = routes.grouped("coureses")
        
        route.group("info") {  req in
            
            req.get(use: {try await getCourses(req: $0)})
            req.post(use: {try await addCourses(req: $0)})
            req.put(":id",use: {try await update(req: $0)})
        }
    }
    
    func getCourses(req:Request) async throws -> [CoursesModel] {
        
        let data = try await CoursesModel.query(on: req.db).all()
        
        return data
    }
    
    func addCourses(req:Request) async throws -> CoursesModel {
        
        let data = try req.query.decode(CoursesModel.self)
        
        try await data.save(on: req.db)
        
        return data
    }
    
    func update(req:Request) async throws -> CoursesModel{
        
        guard let infoByID = try await CoursesModel.find(req.parameters.get("id"), on: req.db) else{
            throw Abort(.notFound)
        }
        
        let updatedTodo = try req.content.decode(CoursesModel.self)
        
        infoByID.name = updatedTodo.name
        infoByID.logo = updatedTodo.logo
     
        try await infoByID.save(on: req.db)
        
        return infoByID
    }
    
}
