pragma solidity ^0.6.0;

import "./IExerciceSolution.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./ERC20Claimable.sol";

contract ExerciceSolution is IExerciceSolution{

    ERC20Claimable claimableERC20;
    mapping(address => uint) public ownedTokens;

    // constructor() ERC20("LucasCoin", "LUC") public{}

    constructor(ERC20Claimable _claimableERC20) public{
        claimableERC20 = _claimableERC20;
    }


    function claimTokensOnBehalf()override external{

        // ERC20Claimable claimableToken = ERC20Claimable(0xE70AE39bDaB3c3Df5225E03032D31301E2E71B6b);
        // claimableToken.claimTokens();
        // claimToken.call(abi.encodeWithSignature("claimTokens()"));

        uint256 claimedTokens = claimableERC20.claimTokens();
        ownedTokens[msg.sender] += claimedTokens;

    }

	function tokensInCustody(address callerAddress)override external returns (uint256){
        return ownedTokens[callerAddress];
    }

	function withdrawTokens(uint256 amountToWithdraw)override external returns (uint256){
        ownedTokens[msg.sender] -= amountToWithdraw;
        claimableERC20.transfer(msg.sender, amountToWithdraw);
    }

	function depositTokens(uint256 amountToWithdraw)override external returns (uint256){
        return 0;
    }

	function getERC20DepositAddress()override external returns (address){

    }

}
