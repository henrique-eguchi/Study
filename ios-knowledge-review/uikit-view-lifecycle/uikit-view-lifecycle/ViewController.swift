import UIKit

// MARK: - UIViewController view lifecycle

// When these methods are called? It get called automatically by the system - so we don't call it directly. It's good to understand WHEN it get called instead.
// Since we inherit from UIViewController we're inheriting all these lifecycle methods from UIViewController - we still use super.viewDidLoad (for example) because we want our custom implementation but we also want to still have the Apple's implementation
//

final class ViewController: UIViewController {
    // It get called when the content view from the UIViewController gets created in memory or loaded from storyboard
    // This has nothing to do with what's displaying on the screen
    // That's why all the IBOutlets will have a guaranteed value in viewDidLoad and that's why it can be implicitly unwrapped out optionals
    // Called once
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // It get called BEFORE content view is ADDED to app's view hierarchy (everytime that it shows up on the screen)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Right place to set the navigationBarHidden to false
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    // It get called AFTER content view is ADDED to app's view hierarchy
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Start animations
    }

    // Similar to viewWillAppear
    // It get called BEFORE the content view is REMOVED to app's view hierarchy
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Commiting save changes - form save on dismiss
    }

    // It get called AFTER the content view is REMOVED to app's view hierarchy
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        // Called when the content view's bounds change, but BEFORE it lays out its subviews
        // There's no default implementation - give us the chance to do any customization
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Called when the content view's bounds change, but AFTER it lays out its subviews
        // There's no default implementation - give us the chance to do any customization
    }

    // Bounds change can be when you rotate from portrait to landscape for instance
}

// MARK: - Q&A

// Question: What is the purpose of the `viewDidLoad` method in the UIViewController lifecycle?
// Answer: The `viewDidLoad` method is called when the content view from the UIViewController gets created in memory or loaded from the storyboard. It is the right place for additional setup after the view has been loaded.

// Question: When is the `viewWillAppear` method called in the UIViewController lifecycle, and what is a common use case for it?
// Answer: The `viewWillAppear` method is called before the content view is added to the app's view hierarchy, every time it shows up on the screen. It is commonly used to perform setup or adjustments just before the view becomes visible, such as setting navigation bar properties.

// Question: What is the purpose of the `viewDidAppear` method, and when is it called in the UIViewController lifecycle?
// Answer: The `viewDidAppear` method is called after the content view is added to the app's view hierarchy. It is the right place to perform actions or start animations when the view is fully visible on the screen.

// Question: In the UIViewController lifecycle, when does the `viewWillDisappear` method get called, and what kind of actions can be performed in it?
// Answer: The `viewWillDisappear` method is called before the content view is removed from the app's view hierarchy. It is suitable for actions like committing save changes or performing cleanup tasks before the view disappears.

// Question: What is the purpose of the `viewDidDisappear` method in the UIViewController lifecycle?
// Answer: The `viewDidDisappear` method is called after the content view is removed from the app's view hierarchy. It is a good place for additional cleanup or actions that need to be performed once the view is no longer visible.

// Question: Explain the role of the `viewWillLayoutSubviews` method in the UIViewController lifecycle.
// Answer: The `viewWillLayoutSubviews` method is called when the content view's bounds change but before it lays out its subviews. It provides an opportunity for customization or adjustments before the layout process.

// Question: When does the `viewDidLayoutSubviews` method get called, and why might it be useful in the UIViewController lifecycle?
// Answer: The `viewDidLayoutSubviews` method is called after the content view's bounds change and after it lays out its subviews. It allows for customization or adjustments after the layout process has completed, making it useful for additional post-layout actions.
