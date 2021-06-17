import SwiftUI

struct IngredientModel: Codable, Hashable {
	
	let foodId: String
	let text: String
	let weight: Double
	let foodCategory: String
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(foodId)
	}
	
	static func ==(lhs: IngredientModel, rhs: IngredientModel) -> Bool {
		if lhs.foodId != rhs.foodId { return false }
		return true
	}
}
