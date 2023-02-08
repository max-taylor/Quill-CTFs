import "./TrueXOR.sol";

contract BoolGiver is IBoolGiver {
    function giveBool() external returns (bool) {
        return gasleft() % 2 > 0;
    }
}
