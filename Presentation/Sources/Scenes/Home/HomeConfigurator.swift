import UIKit

public final class HomeConfigurator {
    public init() { }

    public func resolve() -> UIViewController {
        let presenter = HomePresenter()
        let viewController = HomeCollectionViewController(presenter: presenter)
        presenter.display = viewController
        let navigationController = UINavigationController(rootViewController: viewController)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]

        navigationController.navigationBar.titleTextAttributes = textAttributes
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.backgroundColor = .white
        navigationController.navigationBar.barTintColor = DesignSystem.Color.acentBaseColor

        return navigationController
    }
}
