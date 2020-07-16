import Anchorage
import UIKit

final class ScoreView: UIView {
    private let size: ScoreViewSize
    private let starsQuantity: Int
    init(size: ScoreViewSize, starsQuantity: Int = 5) {
        self.size = size
        self.starsQuantity = starsQuantity

        super.init(frame: .zero)

        setup()
    }

    private lazy var starButtons: [UIButton] = {
        let range = 0..<starsQuantity
        return range.map { _ in
            let button = UIButton()
            button.setImage(size.grayStarImage.image, for: .normal)
            button.setImage(size.goldStarImage.image, for: .selected)
            return button
        }
    }()

    private lazy var starsStackView: UIStackView = {
        return StackViewBuilder {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.alignment = .leading
            $0.spacing = 3.5
            $0.arrangedSubviews = starButtons
        }.build()
    }()
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { nil }

    private func setup() {
        addSubview(starsStackView)

        starsStackView.edgeAnchors == edgeAnchors
    }

    private func sanitizeScore(_ score: Int) -> Int {
        if score < 0 {
            return 0
        } else if score > starsQuantity {
            return starsQuantity
        } else {
            return score
        }
    }
}

extension ScoreView {
    func updateScore(_ score: Int) {
        let sanitizedScore = sanitizeScore(score)

        starButtons.enumerated().forEach {
            $0.element.isSelected = $0.offset < sanitizedScore
        }
    }
}

enum ScoreViewSize {
    case regular
    case small

    var goldStarImage: ImageAsset {
        switch self {
        case .regular:
            return Asset.icGoldStarRegular
        case .small:
            return Asset.icGoldStarSmall
        }
    }

    var grayStarImage: ImageAsset {
        switch self {
        case .regular:
            return Asset.icGrayStarRegular
        case .small:
            return Asset.icGrayStarSmall
        }
    }
}
