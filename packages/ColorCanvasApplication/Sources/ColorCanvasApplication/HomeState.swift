import ColorCanvasDomain

public enum HomeState: Equatable {
    case loading
    case ready(HomeViewData)
    case empty
    case error(AppError)
}
