import UIKit

public final class HomeConfigurator {
    public init() { }

    public func resolve() -> UIViewController {
        let viewController = HomeCollectionViewController(presenter: HomePresenter())
        return UINavigationController(rootViewController: viewController)
    }
}
