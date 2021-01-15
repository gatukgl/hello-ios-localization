import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var title1: UILabel!
    @IBOutlet weak var languageIndex: UISegmentedControl!

    var presenter: ViewPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = ViewPresenter()

        setupDefaultChosenLanguage()
        displayChosenLanguage()
    }

    private func setupDefaultChosenLanguage() {
        let language = presenter?.getDeviceLanguage()
        languageIndex.selectedSegmentIndex = language == "en" ? 0 : 1
    }

    private func displayChosenLanguage() {
        title1.text = presenter?.getPhrasesFor(key: "title")
    }

    @IBAction func onLanguageChanged(_ sender: Any) {
        let language = languageIndex.selectedSegmentIndex ==  0 ? "en" : "th"
        UserDefaults.standard.set(language, forKey: "currentLanguage")
        displayChosenLanguage()
    }
}

