/*
 ████████████████                             @title          HYPERSONIC L2 ROUTER V1
    ▓▓▓▓▓▓▓▓▓▓▓█████          ██████████      @website        https://hypersonic.money   
      ▓▓▓▓▓▓▓▓▓████████     ████▓▓▓▓▓▓▓       @documentation  https://docs.hypersonic.money 
         ▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒          @github         https://github.com/hypersonicmoney 
             ▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒░               
               ▓▓▓▓▓▓▓▓▓▓▓▓▒░                 ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓███████▓▒░░▒▓████████▓▒░▒▓███████▓▒░ ░▒▓███████▓▒░░▒▓██████▓▒░░▒▓███████▓▒░░▒▓█▓▒░░▒▓██████▓▒░  
           ███████▒▒▒▒▒▒▒▒                    ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ 
         ▓▓▓▓▓▒▒▒▒▒▒▒▒                        ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░        
        ██▓▒▒▒▒▒▒▒▒▒                          ░▒▓████████▓▒░░▒▓██████▓▒░░▒▓███████▓▒░░▒▓██████▓▒░ ░▒▓███████▓▒░ ░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░        
        ▓▓▓▓▓▒▒░░                             ░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓█▓▒░      ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░        
        ▒▒▓▒▒▒                                ░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓█▓▒░      ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ 
        ▒▒▒▒                                  ░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓█▓▒░      ░▒▓████████▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓███████▓▒░ ░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓██████▓▒░                                                                                                                                                                                                                                           
*/

// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

// OpenZeppelin Contracts v4.4.1 (utils/Context.sol)

/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}

// OpenZeppelin Contracts (last updated v4.7.0) (access/Ownable.sol)

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() {
        _transferOwnership(_msgSender());
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        _checkOwner();
        _;
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if the sender is not the owner.
     */
    function _checkOwner() internal view virtual {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        _transferOwnership(address(0));
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Internal function without access restriction.
     */
    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}

// OpenZeppelin Contracts v4.4.1 (token/ERC20/extensions/draft-IERC20Permit.sol)

/**
 * @dev Interface of the ERC20 Permit extension allowing approvals to be made via signatures, as defined in
 * https://eips.ethereum.org/EIPS/eip-2612[EIP-2612].
 *
 * Adds the {permit} method, which can be used to change an account's ERC20 allowance (see {IERC20-allowance}) by
 * presenting a message signed by the account. By not relying on {IERC20-approve}, the token holder account doesn't
 * need to send a transaction, and thus is not required to hold Ether at all.
 */
interface IERC20Permit {
    /**
     * @dev Sets `value` as the allowance of `spender` over ``owner``'s tokens,
     * given ``owner``'s signed approval.
     *
     * IMPORTANT: The same issues {IERC20-approve} has related to transaction
     * ordering also apply here.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `deadline` must be a timestamp in the future.
     * - `v`, `r` and `s` must be a valid `secp256k1` signature from `owner`
     * over the EIP712-formatted function arguments.
     * - the signature must use ``owner``'s current nonce (see {nonces}).
     *
     * For more information on the signature format, see the
     * https://eips.ethereum.org/EIPS/eip-2612#specification[relevant EIP
     * section].
     */
    function permit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    /**
     * @dev Returns the current nonce for `owner`. This value must be
     * included whenever a signature is generated for {permit}.
     *
     * Every successful call to {permit} increases ``owner``'s nonce by one. This
     * prevents a signature from being used multiple times.
     */
    function nonces(address owner) external view returns (uint256);

    /**
     * @dev Returns the domain separator used in the encoding of the signature for {permit}, as defined by {EIP712}.
     */
    // solhint-disable-next-line func-name-mixedcase
    function DOMAIN_SEPARATOR() external view returns (bytes32);
}

// OpenZeppelin Contracts (last updated v4.8.0) (utils/Address.sol)

/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     *
     * [IMPORTANT]
     * ====
     * You shouldn't rely on `isContract` to protect against flash loan attacks!
     *
     * Preventing calls from contracts is highly discouraged. It breaks composability, breaks support for smart wallets
     * like Gnosis Safe, and does not provide security since it can be circumvented by calling from a contract
     * constructor.
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies on extcodesize/address.code.length, which returns 0
        // for contracts in construction, since the code is only stored at the end
        // of the constructor execution.

        return account.code.length > 0;
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        (bool success, ) = recipient.call{value: amount}("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain `call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value
    ) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        (bool success, bytes memory returndata) = target.call{value: value}(data);
        return verifyCallResultFromTarget(target, success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        return functionStaticCall(target, data, "Address: low-level static call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal view returns (bytes memory) {
        (bool success, bytes memory returndata) = target.staticcall(data);
        return verifyCallResultFromTarget(target, success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.4._
     */
    function functionDelegateCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionDelegateCall(target, data, "Address: low-level delegate call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.4._
     */
    function functionDelegateCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        (bool success, bytes memory returndata) = target.delegatecall(data);
        return verifyCallResultFromTarget(target, success, returndata, errorMessage);
    }

    /**
     * @dev Tool to verify that a low level call to smart-contract was successful, and revert (either by bubbling
     * the revert reason or using the provided one) in case of unsuccessful call or if target was not a contract.
     *
     * _Available since v4.8._
     */
    function verifyCallResultFromTarget(
        address target,
        bool success,
        bytes memory returndata,
        string memory errorMessage
    ) internal view returns (bytes memory) {
        if (success) {
            if (returndata.length == 0) {
                // only check isContract if the call was successful and the return data is empty
                // otherwise we already know that it was a contract
                require(isContract(target), "Address: call to non-contract");
            }
            return returndata;
        } else {
            _revert(returndata, errorMessage);
        }
    }

    /**
     * @dev Tool to verify that a low level call was successful, and revert if it wasn't, either by bubbling the
     * revert reason or using the provided one.
     *
     * _Available since v4.3._
     */
    function verifyCallResult(
        bool success,
        bytes memory returndata,
        string memory errorMessage
    ) internal pure returns (bytes memory) {
        if (success) {
            return returndata;
        } else {
            _revert(returndata, errorMessage);
        }
    }

    function _revert(bytes memory returndata, string memory errorMessage) private pure {
        // Look for revert reason and bubble it up if present
        if (returndata.length > 0) {
            // The easiest way to bubble the revert reason is using memory via assembly
            /// @solidity memory-safe-assembly
            assembly {
                let returndata_size := mload(returndata)
                revert(add(32, returndata), returndata_size)
            }
        } else {
            revert(errorMessage);
        }
    }
}

/**
 * @title SafeERC20
 * @dev Wrappers around ERC20 operations that throw on failure (when the token
 * contract returns false). Tokens that return no value (and instead revert or
 * throw on failure) are also supported, non-reverting calls are assumed to be
 * successful.
 * To use this library you can add a `using SafeERC20 for IERC20;` statement to your contract,
 * which allows you to call the safe operations as `token.safeTransfer(...)`, etc.
 */
library SafeERC20 {
    using Address for address;

    function safeTransfer(
        IERC20 token,
        address to,
        uint256 value
    ) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(
        IERC20 token,
        address from,
        address to,
        uint256 value
    ) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    /**
     * @dev Deprecated. This function has issues similar to the ones found in
     * {IERC20-approve}, and its usage is discouraged.
     *
     * Whenever possible, use {safeIncreaseAllowance} and
     * {safeDecreaseAllowance} instead.
     */
    function safeApprove(
        IERC20 token,
        address spender,
        uint256 value
    ) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        require(
            (value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(
        IERC20 token,
        address spender,
        uint256 value
    ) internal {
        uint256 newAllowance = token.allowance(address(this), spender) + value;
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(
        IERC20 token,
        address spender,
        uint256 value
    ) internal {
        unchecked {
            uint256 oldAllowance = token.allowance(address(this), spender);
            require(oldAllowance >= value, "SafeERC20: decreased allowance below zero");
            uint256 newAllowance = oldAllowance - value;
            _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
        }
    }

    function safePermit(
        IERC20Permit token,
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) internal {
        uint256 nonceBefore = token.nonces(owner);
        token.permit(owner, spender, value, deadline, v, r, s);
        uint256 nonceAfter = token.nonces(owner);
        require(nonceAfter == nonceBefore + 1, "SafeERC20: permit did not succeed");
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function _callOptionalReturn(IERC20 token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves. We use {Address-functionCall} to perform this call, which verifies that
        // the target address contains contract code and also asserts for success in the low-level call.

        bytes memory returndata = address(token).functionCall(data, "SafeERC20: low-level call failed");
        if (returndata.length > 0) {
            // Return data is optional
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

// OpenZeppelin Contracts (last updated v4.6.0) (token/ERC20/IERC20.sol)

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `from` to `to` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);
}

// @dev IWETH
interface IWETH {
    function deposit() external payable;
    function withdraw(uint256) external;
    function transfer(address to, uint256 value) external returns (bool);
    function transferFrom(address from, address to, uint256 value) external returns (bool);
}

// @dev Minimal interface for playing with a Hypersonic executor.
interface IHYPERSONICEXECUTOR {
    struct GenericInfo { address in_token;  address out_token; uint256 in_amount; uint256 min_out_amount; }
    function execute(GenericInfo calldata info, bytes calldata path) external payable returns (uint256);
}

contract HypersonicRouterV1 is Ownable {
    using SafeERC20 for IERC20;
    /********************** CONSTANTS *****************************/
    address private constant ETH_ADDRESS = address(0);
    uint256 private constant BASIS_POINTS = 10000;
    uint256 private constant L2_STORAGE_SLOT = 0xc0ffee0000000000000000000000000000000000000000000000000000000000;

    /*********************** MUTABLES *****************************/
    IHYPERSONICEXECUTOR public HYPERSONIC_EXECUTOR;
    uint256 public MAX_POS_SLIPPAGE_FEE;
    uint64 public MAX_REFERRAL_FEE;
    uint32 public TOTAL_REF;
    address private _owner;

    /********************** IMMUTABLES ****************************/
    IWETH public immutable WETH;

    /************************ EVENTS ****************************/
    /// @dev Generic event emitted for each swap from one token for another.
    event Swap(address indexed user, address in_token, address out_token, uint256 in_amount, uint256 out_amount);
    /// @dev Event emitted when a referral fee is paid.
    event ReferralFeePaid(uint32 indexed referral_code, address indexed beneficiary, address out_token, uint256 fee_amount);
    /// @dev Event emitted when a new referrer is registered.
    event ReferralRegistered(address indexed beneficiary, uint32 indexed referral_code, uint64 referral_fee);
    /// @dev Event emitted when a referrer is updated.
    event ReferralUpdated(address indexed beneficiary, uint32 indexed referral_code, uint64 new_referral_fee);
    /// @dev Emitted when `HYPERSONIC_EXECUTOR` is updated to a new version.
    event ExecutorUpdated(address new_executor);

    /************************ ERRORS ****************************/
    /// @dev Throws if trying to swap token0 for token0.
    error SameToken(address token);
    /// @dev Splippage protection, throws if min_output > output.
    error InsufficientOutput(uint256 output, uint256 min_output);
    /// @dev Caller not owner.
    error Unauthorized(address sender, address owner);
    /// @dev Not `HYPERSONIC_EXECUTOR`.
    error InvalidExecutor();
    /// @dev Throws if ETH transfer fail.
    error NativeTransferFailed();
    /// @dev Throws if Referrer fee > MAX_REFERRAL_FEE.
    error FeeTooHigh(uint64 fee, uint64 MAX_REFERRAL_FEE);
    /// @dev Throws if try to desactivate an unexisting referral_code.
    error NoActiveReferral();

    /*********************** STRUCTS ****************************/
    /// @dev Struct only used internally for assembly operations.
    struct GenericInfo { 
        address in_token;  
        address out_token;
        uint256 in_amount;
        uint256 min_out_amount;
        uint32 referral_code;
    }
    /// @dev Struct with all information for a given referral.
    struct ReferralInfo {
        uint64 referral_fee;
        address beneficiary;
        bool registered;
    }

    /// @dev Contains ReferralInfo struct for a `referral_code`.
    mapping(uint32 => ReferralInfo) public referral_lookup;
    /// @dev Contains `referral_code` from beneficiary address.
    mapping(address => uint32) public beneficiary_code;

    constructor(
        address _weth,
        address _executor,
        uint256 _initMPSF,
        uint64 _initMRF
    ) Ownable() {
        WETH = IWETH(_weth);
        HYPERSONIC_EXECUTOR = IHYPERSONICEXECUTOR(_executor); 
        MAX_POS_SLIPPAGE_FEE = _initMPSF;
        MAX_REFERRAL_FEE = _initMRF;
    }

    /***************************************************************
                             HYPERSWAP
    ***************************************************************/

    /// @notice L2 Optimized hyperswap using compact calldata encoding.
    /// @param info Encoded GenericInfo struct.
    /// @param path Encoded path to be executed by `HYPERSONIC_EXECUTOR`.
    function hyperswap(bytes calldata info, bytes calldata path) external payable returns (uint256) {
        GenericInfo memory swap_info;
        assembly {
            function get_address(curr_pos) -> res, new_pos {
                let pre := shr(240, calldataload(curr_pos))
                switch pre
                case 0x0000 { 
                    res := 0
                    new_pos := add(curr_pos, 2)
                }
                case 0x0001 { 
                    res := and(shr(96, calldataload(add(curr_pos, 2))), 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
                    new_pos := add(curr_pos, 22)
                }
                default { 
                    res := sload(add(L2_STORAGE_SLOT, sub(pre, 2)))
                    new_pos := add(curr_pos, 2)
                }
            }
            function get_amount(curr_pos) -> res, new_pos {
                let l := shr(248, calldataload(curr_pos))
                res := shr(sub(256, mul(l, 8)), calldataload(add(curr_pos, 1)))
                new_pos := add(curr_pos, add(l, 1))
            }
            let pos := info.offset
            let end := add(info.offset, info.length)
            let res
            res, pos := get_address(pos)
            mstore(swap_info, res)
            res, pos := get_address(pos)
            mstore(add(swap_info, 0x20), res)
            let amount
            amount, pos := get_amount(pos)
            mstore(add(swap_info, 0x40), amount)
            amount, pos := get_amount(pos)
            mstore(add(swap_info, 0x60), amount)
            let r_bytes := sub(end, pos)
            if gt(r_bytes, 3) { 
                let referral_code := shr(224, calldataload(pos))
                mstore(add(swap_info, 0x80), referral_code)
            }
        }
        return _execute_hyperswap(swap_info, path);
    }

    /// @notice Internal function to execute the hyperswap after decoding params.
    /// @dev Separated to avoid stack too deep err.
    function _execute_hyperswap(GenericInfo memory swap_info, bytes calldata path) internal returns (uint256 user_amount) {
        if (swap_info.in_token == swap_info.out_token) revert SameToken(swap_info.in_token);
        address IN = _handle_input(swap_info.in_token, swap_info.in_amount);
        address OUT = _get_output(swap_info.out_token); 
        IERC20(IN).approve(address(HYPERSONIC_EXECUTOR), swap_info.in_amount);
        uint256 out_amount = HYPERSONIC_EXECUTOR.execute{value: msg.value}(IHYPERSONICEXECUTOR.GenericInfo({in_token: IN, out_token: OUT, in_amount: swap_info.in_amount, min_out_amount: swap_info.min_out_amount}), path);
        if (out_amount < swap_info.min_out_amount) revert InsufficientOutput(out_amount, swap_info.min_out_amount);
        out_amount = _process_slippage(out_amount, swap_info.min_out_amount);
        uint256 ref_fee = 0;
        if (swap_info.referral_code != 0) ref_fee = _process_referral(swap_info.referral_code, out_amount, OUT);
        user_amount = out_amount - ref_fee;
        _handle_output(swap_info.out_token, user_amount);
        emit Swap(msg.sender, swap_info.in_token, swap_info.out_token, swap_info.in_amount, user_amount);
        return user_amount;
    }

    /**************************************************************
                              HELPERS
    **************************************************************/

    /// @notice View function to get a cached address by index.
    /// @param index Index to lookup into L2_STORAGE_SLOT for usage when storage is cheaper than calldata.
    function get_from_cache(uint256 index) external view returns (address result) {
        assembly {
            result := sload(add(L2_STORAGE_SLOT, index))
        }
    }

    /// @notice Internal function to handle input wrapping or input transferFrom.
    function _handle_input(address in_token, uint256 in_amount) internal returns (address) {
        if (in_token == ETH_ADDRESS) {
            require(msg.value == in_amount, "WRONG_INPUT");
            _wrapETH();
            return address(WETH);
        } else {
            IERC20(in_token).safeTransferFrom(msg.sender, address(this), in_amount);
            return in_token;
        }
    }

    /// @notice Internal function to handle output unwrapping and/or output transfer.
    function _handle_output(address out_token, uint256 out_amount) internal {
        if (out_token == ETH_ADDRESS) {
            _unwrapETH(out_amount);
            payable(msg.sender).transfer(out_amount);
        } else IERC20(out_token).safeTransfer(msg.sender, out_amount);
    }

    /// @notice Internal (reduce code repetition).
    function _get_output(address out_token) internal view returns (address) {
        return out_token == ETH_ADDRESS ? address(WETH) : out_token;
    }

    /// @notice Internal function to calculate if positive slippage to collect.
    function _process_slippage(uint256 amount_out, uint256 min_amount_out) internal view returns (uint256) {
        if (amount_out > min_amount_out) return amount_out - (((amount_out - min_amount_out) * MAX_POS_SLIPPAGE_FEE) / BASIS_POINTS);
        else return amount_out;
    }

    /// @notice Internal function to process referral and pay the fee if applicable.
    function _process_referral(uint32 referral_code, uint256 out_amount, address out_token) internal returns (uint256 fee_amount) {
        ReferralInfo memory referral = referral_lookup[referral_code];
        if (!referral.registered) return 0;
        fee_amount = (out_amount * referral.referral_fee) / BASIS_POINTS;
        if (fee_amount == 0) return 0;
        IERC20(out_token).safeTransfer(referral.beneficiary, fee_amount); 
        emit ReferralFeePaid(referral_code, referral.beneficiary, out_token, fee_amount);
        return fee_amount;
    }
    
    /**************************************************************
                             WRAPPING
    **************************************************************/

    /// @notice Internal function to wrap Native to WNative.
    function _wrapETH() internal {
        WETH.deposit{value: msg.value}();
    }

    /// @notice Internal function to unwrap WNative to Native.
    function _unwrapETH(uint256 amount) internal {
       WETH.withdraw(amount);
    }

    /// @notice External function for a direct wrap Native to WNative.
    function wrapETH() external payable {
        uint256 amount = msg.value;
        WETH.deposit{value: amount}();
        require(WETH.transfer(msg.sender, amount));
    }

    /// @notice External function for a direct unwrap WNative to Native.
    function unwrapETH(uint256 amount) external {
        require(WETH.transferFrom(msg.sender, address(this), amount));
        WETH.withdraw(amount);
        payable(msg.sender).transfer(amount);
    }
    
    /**************************************************************
                             REFERRAL
    **************************************************************/

    /// @notice Register as a referrer or update your referral fee.
    /// @param referral_fee The fee percentage in basis points (max 1%)
    function register_ref_code(uint64 referral_fee) external {
        if (referral_fee > MAX_REFERRAL_FEE) revert FeeTooHigh(referral_fee, MAX_REFERRAL_FEE);
        uint32 code = beneficiary_code[msg.sender];
        if (code != 0) {
            ReferralInfo storage referral = referral_lookup[code];
            referral.referral_fee = referral_fee;
            emit ReferralUpdated(msg.sender, code, referral_fee);
        } else {
            TOTAL_REF++;
            uint32 new_code = TOTAL_REF;
            referral_lookup[new_code] = ReferralInfo({ referral_fee: referral_fee, beneficiary: msg.sender, registered: true });
            beneficiary_code[msg.sender] = new_code;
            emit ReferralRegistered(msg.sender, new_code, referral_fee);
        }
    }

    /**************************************************************
                              CONFIG
    **************************************************************/

    /// @notice Add new addresses to cache storage slot for usage when storage is cheaper than calldata.
    /// @param index Storage index.
    /// @param addr Address to cache.
    function add_CACHE(uint256 index, address addr) external onlyOwner {
        assembly {
            sstore(add(L2_STORAGE_SLOT, index), addr)
        }
    }

    /// @notice Update `HYPERSONIC_EXECUTOR` version.
    function set_EXEC(address _executor) external onlyOwner {
        if (_executor == address(0)) revert InvalidExecutor();
        HYPERSONIC_EXECUTOR = IHYPERSONICEXECUTOR(_executor);
        emit ExecutorUpdated(_executor);
    }

    /// @notice Update `MAX_POS_SLIPPAGE_FEE`.
    function set_MPSF(uint256 _MPSF) external onlyOwner {
        MAX_POS_SLIPPAGE_FEE = _MPSF;
    }

    /// @notice Update `MAX_REFERRAL_FEE`.
    function set_MRF(uint64 _MRF) external onlyOwner {
        MAX_REFERRAL_FEE = _MRF;
    }

    /**************************************************************
                              WITHDRAWALS
    **************************************************************/

    /// @notice Withdraw Native.
    function eth_withdraw() external onlyOwner {
        uint256 amount = address(this).balance;
        payable(owner()).transfer(amount);
    }

    /// @notice Withdraw an ERC20.
    function s_withdraw(address token) external onlyOwner {
        uint256 amount = IERC20(token).balanceOf(address(this));
        IERC20(token).safeTransfer(owner(), amount);
    }

    /// @notice Withdraw multiple ERC20s.
    function m_withdraw(address[] memory tokens) external onlyOwner {
        for (uint256 i = 0; i < tokens.length; i++) {
            uint256 amount = IERC20(tokens[i]).balanceOf(address(this));
            IERC20(tokens[i]).safeTransfer(owner(), amount);
        }
    }

    receive() external payable {}
}