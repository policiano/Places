import Anchorage
import UIKit

final class PlaceCell: UICollectionViewCell {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title example"
        label.font = .heading2
        label.textColor = DesignSystem.Color.acentTextColor
        return label
    }()

    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Category example"
        label.font = .body3
        label.textColor = DesignSystem.Color.secondaryTextColor
        return label
    }()

    private let scoreView = ScoreView(size: .small)

    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "3.8"
        label.font = .caption
        label.textColor = DesignSystem.Color.captionTextColor
        return label
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = ColorRandomizer().randomColor
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { nil }

    private func setup() {
        setupLayers()
        setupContentLayout()

        contentView.backgroundColor = .systemBackground
    }

    private func setupLayers() {
        contentView.layer.cornerRadius = 16
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = DesignSystem.Color.borderColor.cgColor
        contentView.layer.masksToBounds = true

        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.1
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        layer.backgroundColor = UIColor.clear.cgColor
    }

    private func setupContentLayout() {
        let stackView = StackViewBuilder {
            let stackView = StackViewBuilder {
                $0.axis = .horizontal
                $0.alignment = .center
                $0.spacing = 4
                $0.arrangedSubviews = [scoreView, scoreLabel]
            }.build()
            $0.alignment = .leading
            $0.arrangedSubviews = [titleLabel, categoryLabel, stackView]
        }.build()

        let outerStackView = StackViewBuilder {
            $0.spacing = 8
            $0.distribution = .fill
            $0.arrangedSubviews = [imageView, stackView]
        }.build()

        contentView.addSubview(outerStackView)

        stackView.horizontalAnchors == outerStackView.horizontalAnchors + 8

        outerStackView.topAnchor == contentView.topAnchor
        outerStackView.horizontalAnchors == contentView.horizontalAnchors
        outerStackView.bottomAnchor == contentView.bottomAnchor - 16
    }


    func update(with viewModel: Home.GetPlaces.ViewModel.Item) {
        titleLabel.text = viewModel.name
        categoryLabel.text = viewModel.category
        scoreLabel.text = viewModel.score
        scoreView.updateScore(viewModel.stars)
    }
}
