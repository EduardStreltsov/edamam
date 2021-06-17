@testable import edamam
import ViewInspector
import XCTest

extension RecipeView: Inspectable {}

class RecipeViewTests: XCTestCase {
    
    let recipe = RecipeModel(id: "1",
        label: "recipe",
        image: "",
        yield: 1,
        calories: 100,
        totalWeight: 100,
        totalTime: 60,
        ingredients: [])
    
    let favoritesVM: FavoriteViewModel = .shared
    
    // dinamic view test example
    func test_buttonImageDifferentWhenRecipeIsInFavorites() throws {
        
        let subject = RecipeView(recipe: recipe)
        
        let imageTag = try subject.inspect()
            .geometryReader()
            .vStack()
            .hStack(1)
            .button(0)
            .labelView()
            .image()
            .tag()
        
        XCTAssertEqual(imageTag, AnyHashable("heart"))
        
        favoritesVM.favoriteRecipes.append(recipe)
    
        let imageTag2 = try subject.inspect()
            .geometryReader()
            .vStack()
            .hStack(1)
            .button(0)
            .labelView()
            .image()
            .tag()
    
        XCTAssertEqual(imageTag2, AnyHashable("heart.fill"))
    }
    
    // user action test example
    func test_onFavoriteButtonTapRecipeAddedToFavorites() throws {
        
        favoritesVM.favoriteRecipes.removeAll()
        
        let subject = RecipeView(recipe: recipe)
    
        XCTAssertEqual(favoritesVM.favoriteRecipes.count, 0)
    
        try subject.inspect()
            .geometryReader()
            .vStack()
            .hStack(1)
            .button(0)
            .tap()
    
        XCTAssertEqual(favoritesVM.favoriteRecipes.count, 1)
    }
}
