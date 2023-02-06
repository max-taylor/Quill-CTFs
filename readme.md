# Quill WETH10 CTF

This Quill CTF challenge is to drain the entire ETH balance out of the vulnerable WETH10 contract.

This vulnerability is due to the fact that the contract doesn't correctly follow Checks, Effects and Interactions pattern. In the withdrawAll method of the contract it first transfers the user their ETH balance and then reads their WETH10 balance to determine how much to burn. Due to the control flow in the contracts being handed over to another account, this account can manipulate their WETH10 balance before it is burnt, this will sidestep having their WETH10 tokens burnt; allowing them to recall the withdrawAll method whilst holding the same WETH10 tokens.

## Attack

Attack steps require an Exploit contract and a Temporary holder contract.

### Exploit contract

Will execute all the exploit operations within a single transaction, so it can all be drained at once.

### Temporary Holder

Will hold WETH10 tokens whilst the WETH10 balance of the exploit contract is read. Will also allow it's WETH10 balance to be drained back into the exploit contract.

### Steps

1. Deposit ETH to the WETH contract, WETH will mint an equal supply of tokens for the deposited ETH
2. Withdraw all from the WETH contract
3. In the fallback of the Exploit contract, send the returned ETH to a temporary holder contract
4. When the WETH10 contract resumes control, it will re-read your WETH10 balance to determine how much to mint. Because the user's entire WETH10 balance is held by another contract now, it will read as 0 and no tokens will be burnt
5. Withdraw WETH10 tokens from the Temporary holder contract
6. Repeat steps 2 - 5, until contract is drained

## Prevention

### Burn

Burn the user's tokens before you transfer them the ETH. This will correctly follow Checks, Effects and Interactions; in that the burn method will check the user's balance, effect it (by burning the tokens) and then finally interact with the user (via the fallback function)

### Prior balance reading

It could alternatively read the user's token balance before sending them ETH, then burn that amount of WETH10 tokens. This will ensure that the user still has all the WETH10 tokens after they are transferred ETH.
