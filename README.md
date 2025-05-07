

# 🎬 MyRatings

En snygg och modern SwiftUI-app där användare kan söka efter filmer och TV-serier från IMDb (via OMDb API) och betygsätta dem. Appen sparar betygen lokalt så att användaren enkelt kan se sina tidigare betygsatta titlar.

## 🚀 Funktionalitet

- 🔍 Sök filmer/serier via OMDb API
- ⭐ Sätt ett betyg (1–10) på varje titel
- 🗂 Visa lista med sparade betyg
- 💾 Lokal lagring med `UserDefaults`

## 🧰 Tekniker

- SwiftUI
- MVVM-arkitektur
- Swift Concurrency (`async/await`)
- UserDefaults
- OMDb API (https://www.omdbapi.com/)

## ⚙️ Så här kör du projektet

1. Klona projektet:
   git clone https://github.com/dittanvändarnamn/MyRatingApp.git
2. Öppna projektet i Xcode: MyRatingApp.xcodeproj
3. Skaffa en API-nyckel från OMDb API
4. Lägg in nyckeln i OMDBService.swift:
private let apiKey = "din_api_nyckel"

Kör projektet i simulator eller på en fysisk enhet.
