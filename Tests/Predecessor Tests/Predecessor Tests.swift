import Subtraction
import Predecessor
import Testing

@Suite
struct `Predecessor Tests` {

    @Test
    func `reports and throws at the least value`() {
        let report = Predecessor.reporting(UInt.zero)
        #expect(report.value == UInt.max)
        #expect(report.overflow)
        #expect(throws: Subtraction.Error.overflow) {
            try Predecessor.exact(UInt.zero)
        }
    }

    @Test
    func `exact and saturating select the previous value`() throws {
        #expect(try Predecessor.exact(UInt(42)) == 41)
        #expect(Predecessor.saturating(UInt.zero) == .zero)
    }
}
