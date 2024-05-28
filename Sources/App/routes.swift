import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    app.get { req async throws in
        try await req.view.render("index", ["title": "Hello Vapor!"])
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }

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

