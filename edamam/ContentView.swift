/*
зробити апку яка
показує 2 таби
	- 1 таба має пошук рецептів
	-- з пошуку можна перейти на страву з описом, інгредієнтами, калоріями...
	-- можливість додати рецепт в улюблені
	- 2 таба - улюблені рецепти і навігація з улюбелених в деталі страви

Результат:
- код пушнути на гітхаб,
- засікти час потрачений на розробку в годинах,
- бути готовим пояснити вибрану архітектуру і код
	- написати кілька юніт тестів (на вибір)
*/

import SwiftUI

struct ContentView: View {
	
	var body: some View {
		
		TabView {
			SearchView()
				.tabItem {
					Label("", systemImage: "magnifyingglass.circle")
				}
			FavoriteView()
				.tabItem {
					Label("", systemImage: "heart")
				}
		}
	}

}
