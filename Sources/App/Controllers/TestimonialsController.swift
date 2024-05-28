//
//  TestimonialsController.swift
//  
//
//  Created by Developer IOS on 28/05/2024.
//

import Vapor
import Fluent


struct TestimonialsController:RouteCollection{
    
    func boot(routes: any Vapor.RoutesBuilder) throws {
        
        let route = routes.grouped("testimonials")
        
        route.group("info") {  req in
            
            req.get(use: {try await getTestimonial(req: $0)})
            req.post(use: {try await addTestimonial(req: $0)})
            req.put(":id",use: {try await update(req: $0)})
        }
    }
    
    func getTestimonial(req:Request) async throws -> [TestimonialsModel] {
        
        let data = try await TestimonialsModel.query(on: req.db).all()
        
        return data
    }
    
    func addTestimonial(req:Request) async throws -> TestimonialsModel {
        
        let data = try req.query.decode(TestimonialsModel.self)
        
        try await data.save(on: req.db)
        
        return data
    }
    func update(req:Request) async throws -> TestimonialsModel{
        
        guard let infoByID = try await TestimonialsModel.find(req.parameters.get("id"), on: req.db) else{
            throw Abort(.notFound)
        }
        
        let updatedTodo = try req.content.decode(TestimonialsModel.self)
        
        infoByID.name = updatedTodo.name
        infoByID.info = updatedTodo.info
        infoByID.logo = updatedTodo.logo
        infoByID.job = updatedTodo.job
      
       
        try await infoByID.save(on: req.db)
        
        return infoByID
    }
    
    
}
