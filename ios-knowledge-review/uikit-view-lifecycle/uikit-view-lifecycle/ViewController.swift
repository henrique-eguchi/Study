import UIKit

// MARK: - UIViewController view lifecycle

final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }


    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        // Called when the content view's bounds change, but BEFORE it lays out its subviews
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Called when the content view's bounds change, but AFTER it lays out its subviews
    }
}

