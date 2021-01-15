import UIKit

class ViewPresenter {
    let phrases: [String: Any] = [
        "en": [
            "title": "English Title"
        ],
        "th": [
            "title": "ไตเติ้ลไทย"
        ]
    ]

    func getDeviceLanguage() -> String {
        return String(
            UserDefaults.standard.string(forKey: "currentLanguage")?.prefix(2) ?? "en"
        )
    }

    func getPhrasesFor(key: String) -> String {
        let language = getDeviceLanguage()
        let allPhrases = phrases[language] as? [String : String]
        return allPhrases?[key] ?? ""
    }
}
