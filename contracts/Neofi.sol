// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
import { ERC20Permit } from "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";




contract Neofi is ERC20, Ownable, ERC20Permit {

  constructor() ERC20('Neofi Token','NEOFI') ERC20Permit('Neofi Token') {
    _mint(msg.sender,350000000 * 10 ** 18);
  }
  /**
     * notice Function to rescue funds
     * Owner is assumed to be governance or NEOFI trusted party to helping users
     * Funtion can be disabled by destroying ownership via `renounceOwnership` function
     * param token Address of token to be rescued
     * param destination User address
     * param amount Amount of tokens
     **/
  function rescueTokens(address token, address destination, uint256 amount) external onlyOwner {
      require(token != destination, "Invalid address");
      require(ERC20(token).transfer(destination, amount), "Retrieve failed");
  }
}
