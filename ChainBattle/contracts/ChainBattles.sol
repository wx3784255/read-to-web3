// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol"; 
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Base64.sol";


// initialize the smart contract
contract ChainBattles is ERC721URIStorage {     
    using Strings for uint256;  
    using Counters for Counters.Counter;    
    Counters.Counter private _tokenIds; 
    
    struct Character {
        uint256 level;      // track level
        uint256 health;     // track health
        uint256 strength;   // track strength
        uint256 speed;      // track speed
    }    

// Map to Character struct. tokenIdToLevels keeps track of the NFT level.
mapping(uint256 => Character) public tokenIdToLevels; 

constructor() ERC721 ("Chain Battles", "CBTLS"){

    }


function getCharacter(uint256 tokenId) public returns(string memory){
    // generated with image to svg converter from picsvg.com
    bytes memory svg = abi.encodePacked(
        '<svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="512.000000pt" height="512.000000pt" viewBox="0 0 512.000000 512.000000" preserveAspectRatio="xMidYMid meet">',
        '<style>.character { fill: white; font-family: verdana; font-size: 40px; }</style>',
        '<style>.base { fill: white; font-family: serif; font-size: 20px; }</style>',
        '<g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)" fill="#000000" stroke="none">',
            '<g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)" fill="#000000" stroke="none">',
            '<path fill="#880404" stroke="#880404" d="M 6727 996 C 6968 1031 7240 1137 7284 1409 C 7249 1674 7118 1921 7121 2192 C 7129 2666 7254 3154 7104 3618 C 6778 3966 6478 4396 6516 4898 C 6508 5397 6943 5755 7369 5925 C 7934 6137 8543 6184 9136 6267 C 8443 6342 7673 6462 7053 6057 C 6692 5864 6522 5477 6367 5120 C 6151 4586 5705 4191 5252 3858 C 5073 3718 4838 3716 4623 3734 C 4086 3776 3561 3930 3079 4166 C 2340 4490 1769 5125 1471 5868 C 1087 6812 1052 7859 1155 8861 C 1265 9917 1725 10906 2316 11776 C 2348 11926 2374 12077 2405 12227 C 1171 10667 698 8545 1098 6600 C 1282 5755 1695 4924 2398 4395 C 3160 3799 4152 3562 5107 3601 C 5621 3614 6121 3763 6636 3760 C 6734 3414 6836 3057 6786 2693 C 6729 2130 6431 1543 6727 996 Z"  />',
        '<path fill="#7ea820" stroke="#7ea820" d="M 7104 3618 C 7861 3193 8780 3175 9606 3382 C 10303 3566 10981 3891 11492 4408 C 12275 5173 12570 6366 12325 7421 C 12300 7602 12148 7713 12021 7825 C 11996 7791 11944 7721 11918 7686 C 11593 7201 11189 6740 10613 6558 C 10147 6356 9637 6302 9136 6267 C 8543 6184 7934 6137 7369 5925 C 6943 5755 6508 5397 6516 4898 C 6478 4396 6778 3966 7104 3618 M 6799 4197 C 6771 4261 6743 4326 6720 4392 C 6627 4847 6706 5396 7150 5640 C 8221 6244 9513 5937 10645 6342 C 11148 6479 11523 6853 11908 7181 L 11941 7239 C 12033 7243 12125 7249 12217 7256 C 12179 6602 11668 6110 11200 5709 C 10929 5510 10688 5234 10340 5180 C 10137 5052 9991 4841 9766 4743 C 9076 4396 8328 4155 7565 4040 C 7290 3973 7069 4205 6799 4197 Z"  />',
        '<path fill="#aa0001" stroke="#aa0001" d="M 3079 4166 C 3561 3930 4086 3776 4623 3734 C 4838 3716 5073 3718 5252 3858 C 5705 4191 6151 4586 6367 5120 C 6522 5477 6692 5864 7053 6057 C 7673 6462 8443 6342 9136 6267 C 9637 6302 10147 6356 10613 6558 C 10904 6806 11195 7062 11425 7370 C 11731 7779 11687 8322 11676 8804 C 11665 9539 11336 10211 11199 10924 C 11074 11402 10773 11806 10515 12220 C 10087 12828 9629 13489 8935 13812 C 8467 13942 7991 14095 7500 14070 C 7100 14053 6703 13975 6302 13991 C 5785 14001 5260 14151 4747 14018 C 4416 13933 4094 13815 3770 13703 C 3421 13554 3175 13248 2920 12979 C 2727 12746 2498 12521 2405 12227 C 2374 12077 2348 11926 2316 11776 C 2904 12457 3527 13164 4373 13523 C 4752 13688 5152 13479 5460 13261 C 6146 12760 6817 12198 7253 11456 C 7728 10665 8121 9749 7983 8806 C 7884 8064 7384 7424 6737 7067 C 6386 6832 5901 6675 5756 6237 C 5676 5807 5765 5368 5785 4936 C 5345 4628 4859 4376 4324 4290 C 4278 4285 4185 4274 4139 4268 C 3786 4229 3433 4183 3079 4166 Z"  />',
        '<path fill="#badf20" stroke="#badf20" d="M 6799 4197 C 7069 4205 7290 3973 7565 4040 C 8328 4155 9076 4396 9766 4743 C 9991 4841 10137 5052 10340 5180 C 10688 5234 10929 5510 11200 5709 C 11668 6110 12179 6602 12217 7256 C 12125 7249 12033 7243 11941 7239 L 11908 7181 C 11514 6305 10537 5942 9640 5865 C 9542 5572 9324 5351 9075 5179 C 9213 5414 9365 5643 9542 5852 C 8807 5826 8025 5904 7346 5566 C 6905 5354 6789 4831 6720 4392 C 6743 4326 6771 4261 6799 4197 M 7419 4264 C 7346 4411 7405 4714 7578 4748 C 7639 4600 7583 4307 7419 4264 M 8629 4450 C 8568 4595 8700 4866 8868 4851 C 8927 4706 8797 4435 8629 4450 Z"  />',
        '<path fill="#d0000e" stroke="#d0000e" d="M 1471 5868 C 1769 5125 2340 4490 3079 4166 C 3433 4183 3786 4229 4139 4268 C 3739 4357 3334 4468 2986 4690 C 1836 5494 1187 6936 1345 8332 C 1559 7715 1635 7045 1979 6478 C 2535 5545 3390 4826 4324 4290 C 4859 4376 5345 4628 5785 4936 C 5765 5368 5676 5807 5756 6237 C 5901 6675 6386 6832 6737 7067 C 7384 7424 7884 8064 7983 8806 C 8121 9749 7728 10665 7253 11456 C 6817 12198 6146 12760 5460 13261 C 5152 13479 4752 13688 4373 13523 C 3527 13164 2904 12457 2316 11776 C 1725 10906 1265 9917 1155 8861 C 1052 7859 1087 6812 1471 5868 Z"  />',
        '<path fill="#880404" stroke="#880404" d="M 10613 6558 C 11189 6740 11593 7201 11918 7686 C 11899 8791 11796 9964 11199 10924 C 11336 10211 11665 9539 11676 8804 C 11687 8322 11731 7779 11425 7370 C 11195 7062 10904 6806 10613 6558 Z"  />',
        '</g>',
       '<rect width="100%" height="100%" opacity="50%" />',
        '<text x="50%" y="40%" class="character" dominant-baseline="middle" text-anchor="middle">',"Warrior Class",'</text>',
        '<text x="50%" y="50%" class="base" dominant-baseline="middle" text-anchor="middle">', "Level: ",getLevel(tokenId),'</text>',
        '<text x="50%" y="60%" class="base" dominant-baseline="middle" text-anchor="middle">', "Health: ",getHealth(tokenId),'</text>',
        '<text x="50%" y="70%" class="base" dominant-baseline="middle" text-anchor="middle">', "Strength: ",getStrength(tokenId),'</text>',
        '<text x="50%" y="80%" class="base" dominant-baseline="middle" text-anchor="middle">', "Speed: ",getSpeed(tokenId),'</text>',
    '</svg>'

    );
    return string(
        abi.encodePacked(
            "data:image/svg+xml;base64,",
            Base64.encode(svg)
        )    
    );
}

// Character statistics
function getLevel(uint256 tokenId) public view returns (string memory){
    // store struct Character.level from Character struct as uint256 _level
    uint256 _level = tokenIdToLevels[tokenId].level; 
    return _level.toString();
}
    // store struct Character.health from Character struct as uint256 _health
function getHealth(uint256 tokenId) public view returns (string memory){
    uint256 _health = tokenIdToLevels[tokenId].health;
    return _health.toString();
}
    // store struct Character.strength as uint256 _strength
function getStrength(uint256 tokenId) public view returns (string memory){
    uint256 _strength = tokenIdToLevels[tokenId].strength;
    return _strength.toString();
}
    // store struct Character.speed as uint256 _speed
function getSpeed(uint256 tokenId) public view returns (string memory){
    uint256 _speed = tokenIdToLevels[tokenId].speed;
    return _speed.toString();
}


function getTokenURI(uint256 tokenId) public returns (string memory) {
    bytes memory dataURI = abi.encodePacked(
        '{',
            '"name": "Chain Battles #', tokenId.toString(), '",',
            '"description": "Battles on-chain",',
            '"image": "', getCharacter(tokenId), '"',
        '}'  
    );
    return string(
        abi.encodePacked(
            "data:application/json;base64,",
            Base64.encode(dataURI)
        )
    );
}

// Create a new NFT
function mint() public {
    _tokenIds.increment();  // increment the value of tokenIds
    uint256 newItemId = _tokenIds.current();    // store the current value to newItemId
    _safeMint(msg.sender, newItemId);   // call safeMint function from the OpenZeppelin ERC721URIStorage.sol library. pass msg sender and current id
    
    // create new item in tokenIdToLevels mapping,
    tokenIdToLevels[newItemId].level = 0;       // initialize level at zero
    tokenIdToLevels[newItemId].health = 10;     // initialize health at 10
    tokenIdToLevels[newItemId].strength = 5;    // initalize strength at 5
    tokenIdToLevels[newItemId].speed = 3;       // initialize speed at 3

    _setTokenURI(newItemId, getTokenURI(newItemId));    // set the token URI passing newItemId, return value of getTokenURI()
}

function train(uint256 tokenId) public {
    require(_exists(tokenId), "Please use an existing token");  // checks if tokenId exists, return message
    require(ownerOf(tokenId) == msg.sender, "You must own this token to train it"); // if the owner of the wallet own the tokenId, return message

    uint256 currentLevel = tokenIdToLevels[tokenId].level;
    uint256 currentHealth = tokenIdToLevels[tokenId].health;
    uint256 currentStrength = tokenIdToLevels[tokenId].strength;
    uint256 currentSpeed = tokenIdToLevels[tokenId].speed;

    tokenIdToLevels[tokenId].level = currentLevel +1;
    // randomize character stats
    tokenIdToLevels[tokenId].health = currentHealth + uint(keccak256(abi.encodePacked(block.timestamp,block.difficulty,msg.sender))) % 20;
    tokenIdToLevels[tokenId].strength = currentStrength + uint(keccak256(abi.encodePacked(block.timestamp,block.difficulty,msg.sender))) % 10;
    tokenIdToLevels[tokenId].speed = currentSpeed + uint(keccak256(abi.encodePacked(block.timestamp,block.difficulty,msg.sender))) % 15;
     
    _setTokenURI(tokenId, getTokenURI(tokenId));        // update the metadata to update the nft
    }
}