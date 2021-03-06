//
//  QuestionCollectionViewDataSource.swift
//  Kinit
//

import UIKit

final class QuestionCollectionViewDataSource: NSObject {
    private struct Constants {
        static let imageQuestionCellSize = CGSize(width: 134, height: 124)
        static let textAnswerCellHeight: CGFloat = 46
        static let textMultipleAnswerCellHeight: CGFloat = 60
        static let textMultipleAnswerCellHeightCompact: CGFloat = 44
        static let collectionViewDualImageSpacing: CGFloat = 0
        static let collectionViewMinimumSpacing: CGFloat = 15
        static let numberOfColumns: UInt = 2
    }

    let question: Question
    let collectionView: UICollectionView

    weak var questionViewController: QuestionViewController?
    var selectedAnswerIds = Set<String>()
    var recognizedCell: SurveyAnswerCollectionViewCell?
    fileprivate(set) var animationIndex = 0
    var answersCount: Int {
        return question.results.count
    }

    init(question: Question, collectionView: UICollectionView) {
        collectionView.register(nib: SurveyTextAnswerCollectionViewCell.self)
        collectionView.register(nib: SurveyMultipleTextAnswerCollectionViewCell.self)
        collectionView.register(nib: SurveyTextImageAnswerCollectionViewCell.self)
        collectionView.register(nib: SurveyImageAnswerCollectionViewCell.self)
        collectionView.register(nib: SurveyFullSizedImageAnswerCollectionViewCell.self)

        self.question = question
        self.collectionView = collectionView

        super.init()

        collectionView.dataSource = self
        collectionView.delegate = self
    }

    func answerCell(_ collectionView: UICollectionView,
                    indexPath: IndexPath) -> UICollectionViewCell {
        let answer = question.results[indexPath.item]

        let cell: SurveyAnswerCollectionViewCell = {
            switch question.type {
            case .text, .textEmoji, .textAndImage, .tip:
                if answer.hasOnlyImage() {
                    return collectionView.dequeueReusableCell(forIndexPath: indexPath)
                        as SurveyImageAnswerCollectionViewCell
                } else if answer.hasImage() {
                    return collectionView.dequeueReusableCell(forIndexPath: indexPath)
                        as SurveyTextImageAnswerCollectionViewCell
                } else {
                    return collectionView.dequeueReusableCell(forIndexPath: indexPath)
                        as SurveyTextAnswerCollectionViewCell
                }
            case .multipleText:
                return collectionView.dequeueReusableCell(forIndexPath: indexPath)
                    as SurveyMultipleTextAnswerCollectionViewCell
            case .dualImage:
                return collectionView.dequeueReusableCell(forIndexPath: indexPath) as
                SurveyFullSizedImageAnswerCollectionViewCell
            }
        }()

        cell.delegate = self
        SurveyViewsFactory.drawCell(cell,
                                    for: answer,
                                    questionType: question.type,
                                    indexPath: indexPath)
        cell.shouldRemainTintedAfterSelection = question.quizData == nil
        cell.shouldTintOnSelection = question.quizData == nil

        cell.isSelected = selectedAnswerIds.contains(answer.identifier)

        return cell
    }

    func incrementAnimationIndex() -> Bool {
        if answersCount == animationIndex {
            return false
        }

        animationIndex += 1

        return true
    }

    func answer(at index: Int, didSelect selected: Bool) {
        guard let viewController = questionViewController else {
            fatalError("QuestionCollectionViewDataSource has no questionViewController assigned.")
        }

        let answer = question.results[index]
        let aId = answer.identifier

        if selected {
            selectedAnswerIds.insert(aId)
        } else {
            selectedAnswerIds.remove(aId)
        }

        viewController.dataSource(didChange: selectedAnswerIds)
    }
}

extension QuestionCollectionViewDataSource: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return animationIndex
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return answerCell(collectionView, indexPath: indexPath)
    }
}

extension QuestionCollectionViewDataSource: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let answer = question.results[indexPath.item]
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height
        let widthWithLateralInset = width - Constants.collectionViewMinimumSpacing * 2

        switch question.type {
        case .text, .textEmoji, .textAndImage, .tip:
            if answer.hasImage() {
                return Constants.imageQuestionCellSize
            }

            return CGSize(width: widthWithLateralInset, height: Constants.textAnswerCellHeight)
        case .multipleText:
            let height = UIDevice.isiPhone5()
                ? Constants.textMultipleAnswerCellHeightCompact
                : Constants.textMultipleAnswerCellHeight

            return CGSize(width: width, height: height)
        case .dualImage:
            return CGSize(width: width, height: height/2)
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        if question.type == .text
            || question.type == .dualImage
            || question.allowsMultipleSelection {
            return .zero
        }

        let widthInsets = question.type == .textAndImage || question.type == .tip
            ? collectionView.equalSpacing(forColumns: Constants.numberOfColumns,
                                          cellWidth: Constants.imageQuestionCellSize.width)
            : Constants.collectionViewMinimumSpacing

        return UIEdgeInsets(top: 0,
                            left: widthInsets,
                            bottom: widthInsets,
                            right: widthInsets)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if question.type == .dualImage {
            return Constants.collectionViewDualImageSpacing
        }

        if question.type == .text {
            return Constants.collectionViewMinimumSpacing
        }

        if question.allowsMultipleSelection {
            return 0
        }

        return collectionView.equalSpacing(forColumns: Constants.numberOfColumns,
                                           cellWidth: Constants.imageQuestionCellSize.width)
    }

    func collectionView(_ collectionView: UICollectionView,
                        willDisplaySupplementaryView view: UICollectionReusableView,
                        forElementKind elementKind: String,
                        at indexPath: IndexPath) {
        view.layer.zPosition = 0
    }

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        collectionView.visibleCells
            .compactMap {
                $0 as? SurveyAnswerCollectionViewCell
            }.forEach {
                $0.cancelTouchIfNeeded()
        }
    }
}

extension QuestionCollectionViewDataSource: SurveyAnswerDelegate {
    func surveyAnswerCellDidSelect(_ cell: SurveyAnswerCollectionViewCell) {
        answer(at: cell.indexPath.item, didSelect: true)
    }

    func surveyAnswerCellDidDeselect(_ cell: SurveyAnswerCollectionViewCell) {
        answer(at: cell.indexPath.item, didSelect: false)
    }

    func surveyAnswerCellDidStartSelecting(_ cell: SurveyAnswerCollectionViewCell) {
        guard let viewController = questionViewController else {
            KLogWarn("QuestionCollectionViewDataSource has no questionViewController assigned.")
            return
        }

        viewController.surveyAnswerCellDidStartSelecting(cell)
    }

    func surveyAnswerCellDidCancelSelecting(_ cell: SurveyAnswerCollectionViewCell) {
        guard let viewController = questionViewController else {
            KLogWarn("QuestionCollectionViewDataSource has no questionViewController assigned.")
            return
        }

        viewController.surveyAnswerCellDidCancelSelecting(cell)
    }
}
