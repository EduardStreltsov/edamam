import SwiftUI

struct RecipeModel: Codable, Identifiable, Equatable {
	
	let id: String
	let label: String
	let image: String
	let yield: Int
	let calories: Double
	let totalWeight: Double
	let totalTime: Double
	let ingredients: [IngredientModel]
	
	var formattedCalories: String {
		calories == 0 ? "unknown" : String(format: "%.2f", calories)
	}
	
	var formattedTotalWeight: String {
		totalWeight == 0 ? "unknown" : String(format: "%.2f", totalWeight)
	}
	
	var formattedTotalTime: String {
		totalTime == 0 ? "unknown" : String(format: "%.2f", totalTime)
	}
	
	enum CodingKeys: String, CodingKey {
		case id = "uri"
		case label
		case image
		case yield
		case calories
		case totalWeight
		case totalTime
		case ingredients
	}
}
