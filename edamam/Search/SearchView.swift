import SwiftUI

struct SearchView: View {
	
	@State private var search = "chicken"
	@StateObject private var searchVM = SearchViewModel()
	
	var body: some View {
		GeometryReader { geometry in
			NavigationView {
				VStack {
					HStack {
						TextField("Find", text: $search)
							.textFieldStyle(RoundedBorderTextFieldStyle())
						
						Button(action: {
							searchVM.search(query: search)
						}) {
							Image(systemName: "magnifyingglass")
								.frame(minWidth: geometry.size.width / 6, minHeight: 34)
								.background(Color.blue)
								.foregroundColor(.white)
								.cornerRadius(6)
								.font(Font.system(size: 19, weight: .semibold))
						}
					}
						.padding()
					
					if searchVM.isSearching {
						ProgressView().progressViewStyle(CircularProgressViewStyle())
						Spacer()
					} else {
						List(searchVM.searchResult) { recipe in
							NavigationLink(destination: RecipeView(recipe: recipe)) {
								Text(recipe.label)
							}
						}
							.listStyle(InsetListStyle())
					}
				}
					.navigationBarTitle("Search", displayMode: .inline)
			}
		}
	}
}
