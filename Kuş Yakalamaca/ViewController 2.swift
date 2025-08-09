import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Klavye odak alabilsin
        self.becomeFirstResponder()
    }
    
    // Klavye input'u alabilmek için gerekli
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    // Klavye tuş dinleme
    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        super.pressesBegan(presses, with: event)
        
        for press in presses {
            if let key = press.key {
                if key.charactersIgnoringModifiers == "1" {
                    goToLevel1()
                }
            }
        }
    }
    
    func goToLevel1() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let level1VC = storyboard.instantiateViewController(withIdentifier: "level1ViewController") as? level1ViewController {
            // Navigation varsa:
            navigationController?.pushViewController(level1VC, animated: true)
            // Navigation yoksa şu satırı kullan:
            // present(level1VC, animated: true)
        }
    }
}
