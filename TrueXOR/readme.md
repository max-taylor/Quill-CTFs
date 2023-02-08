# Quill TrueXOR

This challenge requires the BoolGiver.sol contract to respond with true and false, the ordering doesn't matter but it needs to return both boolean values.

The tricky part is the giveBool method is a view function and cannot modify the state, so a solution is to read from the global state and use something there so that it can alternate between boolean responses. I opted to use gasleft() and to take a modulo of it, testing if the value is > 0. This has flaws it could be that the gasleft() method returns the same modulo response, thereby sending back the same boolean response. But in this case it passes the test.

Also note that in my foundry test I am using vm.prank to get passed the tx.origin == msg.sender check, I could alternatively use hardhat and send the transaction directly with a wallet but this is simpler.
