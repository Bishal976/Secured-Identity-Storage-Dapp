// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Upload {
  
  struct Access{
     address user; 
     bool access; //true or false
  }
  mapping(address=>string[]) value;
  mapping(address=>mapping(address=>bool)) ownership;
  mapping(address=>Access[]) accessList;
  mapping(address=>mapping(address=>bool)) previousData;

  // adds the url to the user's list of uploaded data
  function add(address _user,string memory url) external {
      value[_user].push(url);
  }

    // allows the user to access the data, by updating permissions in ownership and accessList
  function allow(address user) external {
      ownership[msg.sender][user]=true; 
      // if the user has already been given access to the data, then just update the accessList don't add a new entry
      if(previousData[msg.sender][user]){
         for(uint i=0;i<accessList[msg.sender].length;i++){
             if(accessList[msg.sender][i].user==user){
                  accessList[msg.sender][i].access=true; 
             }
         }
      }else{
          accessList[msg.sender].push(Access(user,true));  
          previousData[msg.sender][user]=true;  
      }
  }

  // disallows the user to access the data, by updating permissions in ownership and accessList
  function disallow(address user) public{
      ownership[msg.sender][user]=false;
      for(uint i=0;i<accessList[msg.sender].length;i++){
          if(accessList[msg.sender][i].user==user){ 
              accessList[msg.sender][i].access=false;  
          }
      }
  }

    // returns the list of data uploaded by the user
  function display(address _user) external view returns(string[] memory){
      require(_user==msg.sender || ownership[_user][msg.sender],"You don't have access");
      return value[_user];
  }

    // returns the list of users who have access to the data
  function shareAccess() public view returns(Access[] memory){
      return accessList[msg.sender];
  }
}