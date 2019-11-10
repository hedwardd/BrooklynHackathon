pragma solidity ^0.4.25;

contract ImpactContract {

    event NewParticipant(string name);

    // Start date of Competition Period
    uint256 public startDate;

    // End date of Competition Period
    uint256 public endDate;

    // Threshold of Units participants must stay under
    uint256 public threshold;

    // Amount of money each participant must wager to take part
    uint256 public wager;

    struct Participant {
        // Name, Account Number to be linked, Usage Measurement
        string name;
        uint natGridAccount;
        uint usage;
    }

    // Array of all participants
    Participant[] public participants;

    // Map of account numbers to participants
    mapping (uint => address) accountToAccount;

    // Map of participants to account numbers
    mapping (address => uint) participantToAccount;

    // Internal method that adds a new participant
    function _createParticipant(string _name, uint _natGridAccount, address _address) internal {
        participants.push(Participant(_name, _natGridAccount, 0));
        accountToAccount[_natGridAccount] = _address;
        participantToAccount[_address] = _natGridAccount;
        emit NewParticipant(name);
    }

    // Public function that allows people to join
    function enterPact(string _name, uint _natGridAccount) public {
        require(accountToAccount[msg.sender] == 0);
        require(participantToAccount[_natGridAccount] == 0);
        _createParticipant(_name, _natGridAccount, msg.sender);
    }

}
