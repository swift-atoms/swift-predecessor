public import Subtraction

/// The identity and fixed-width integer kernel for selecting a previous value.
public enum Predecessor {

    @inlinable
    public static func reporting<Value: FixedWidthInteger>(
        _ value: Value
    ) -> (value: Value, overflow: Bool) {
        Subtraction.reporting(value, 1)
    }

    @inlinable
    public static func exact<Value: FixedWidthInteger>(
        _ value: Value
    ) throws(Subtraction.Error) -> Value {
        try Subtraction.exact(value, 1)
    }

    @inlinable
    public static func saturating<Value: FixedWidthInteger>(_ value: Value) -> Value {
        Subtraction.saturating(value, 1)
    }
}
