import "faucet.sol";

contract Token is mortal {
    Faucet _faucet;

    constructor(address _f) {
        // _faucet = (new Faucet).value(0.5 ether)();
        _faucet = Faucet(payable(_f));
        (bool success, ) = _faucet.call{}(abi.encodeWithSignature("withdraw(uint)", 0.1 ether));
        require(success, "Transfer failed.");
    }

    // function deactivate() onlyOwner {
    //     _faucet.deactivate();
    // }
}
