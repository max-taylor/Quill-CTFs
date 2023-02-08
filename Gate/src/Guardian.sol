import "./Gate.sol";

contract Guardian is IGuardian {
    Gate gate;

    constructor(Gate _gate) {
        gate = _gate;
    }

    function f00000000_bvvvdlt() external view returns (address) {
        return address(gate);
    }

    function f00000001_grffjzz() external view returns (address) {
        return tx.origin;
    }
}
