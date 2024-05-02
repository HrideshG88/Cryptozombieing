// SPDX-License-Identifier: MIT

// #Description: CryptoZombies Solidity Course.
// #Lesson: 1

pragma solidity >=0.5.0 <0.8.0;

contract zombieFactory {
    event NewZombie(uint ZombieId, string name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    //function createZombie(string memory _name, uint _dna) public {
    //    zombies.push(Zombie(_name, _dna));
    //}

    function _createZombie(string memory _name, uint _dna) private {
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
        emit NewZombie(id, _name, _dna);
    }

    function _generateRandomDna(
        string memory _str
    ) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomZombie(string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }
}
