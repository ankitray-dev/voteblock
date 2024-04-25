// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Smart contract for conducting voting

contract Voting {
    // Struct to represent a candidate
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    // Array to store candidates
    Candidate[] public candidates;
    // Address of the contract owner
    address owner;
    // Mapping to track whether an address has voted
    mapping(address => bool) public voters;

    // Variables to store voting start and end timestamps
    uint256 public votingStart;
    uint256 public votingEnd;

    // Constructor to initialize candidates and voting duration
    constructor(string[] memory _candidateNames, uint256 _durationInMinutes) {
        // Initialize candidates
        for (uint256 i = 0; i < _candidateNames.length; i++) {
            candidates.push(Candidate({
                name: _candidateNames[i],
                voteCount: 0
            }));
        }
        // Set owner as contract deployer
        owner = msg.sender;
        // Set voting start and end timestamps
        votingStart = block.timestamp;
        votingEnd = block.timestamp + (_durationInMinutes * 1 minutes);
    }

    // Modifier to restrict access to only the contract owner
    modifier onlyOwner {
        require(msg.sender == owner, "Only the contract owner can perform this operation.");
        _;
    }

    // Function to add a new candidate (only accessible to the owner)
    function addCandidate(string memory _name) public onlyOwner {
        candidates.push(Candidate({
            name: _name,
            voteCount: 0
        }));
    }

    // Function for voting
    function vote(uint256 _candidateIndex) public {
        require(!voters[msg.sender], "You have already voted.");
        require(_candidateIndex < candidates.length, "Invalid candidate index.");

        candidates[_candidateIndex].voteCount++;
        voters[msg.sender] = true;
    }

    // Function to retrieve all candidates
    function getAllVotesOfCandiates() public view returns (Candidate[] memory){
        return candidates;
    }

    // Function to check the voting status
    function getVotingStatus() public view returns (bool) {
        return (block.timestamp >= votingStart && block.timestamp < votingEnd);
    }

    // Function to get the remaining time for voting
    function getRemainingTime() public view returns (uint256) {
        require(block.timestamp >= votingStart, "Voting has not started yet.");
        if (block.timestamp >= votingEnd) {
            return 0;
        }
        return votingEnd - block.timestamp;
    }
}
