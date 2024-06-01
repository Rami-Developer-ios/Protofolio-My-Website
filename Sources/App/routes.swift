import Fluent
import Vapor

func routes(_ app: Application) throws {
    
  
    try app.register(collection: ExperienceController())
    
    try app.register(collection: PersonController())
    
    try app.register(collection: ProtofolioController())
    
    try app.register(collection: SkillsController())
    
    try app.register(collection: CoursesController())
    
    try app.register(collection: TestimonialsController())
    
    let websiteController = WebsiteController()
    try app.register(collection: websiteController)
}

struct InfoResponse:Content {
    
    let request: PersonModel
}

