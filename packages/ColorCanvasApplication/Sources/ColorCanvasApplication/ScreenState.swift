import ColorCanvasDomain

public enum ScreenState<Value> {
    case idle
    case loading
    case loaded(Value)
    case failed(AppError)
}

extension ScreenState: Equatable where Value: Equatable {}
